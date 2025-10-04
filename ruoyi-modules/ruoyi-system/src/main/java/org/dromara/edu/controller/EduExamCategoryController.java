package org.dromara.edu.controller;

import java.util.List;

import lombok.RequiredArgsConstructor;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import org.dromara.common.idempotent.annotation.RepeatSubmit;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.web.core.BaseController;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.excel.utils.ExcelUtil;
import org.dromara.edu.domain.vo.EduExamCategoryVo;
import org.dromara.edu.domain.bo.EduExamCategoryBo;
import org.dromara.edu.service.IEduExamCategoryService;

/**
 * 考试分类
 *
 * @author eezd
 * @date 2025-10-04
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/edu/examCategory")
public class EduExamCategoryController extends BaseController {

    private final IEduExamCategoryService eduExamCategoryService;

    /**
     * 查询考试分类列表
     */
    @SaCheckPermission("edu:examCategory:list")
    @GetMapping("/list")
    public R<List<EduExamCategoryVo>> list(EduExamCategoryBo bo) {
        List<EduExamCategoryVo> list = eduExamCategoryService.queryList(bo);
        return R.ok(list);
    }

    /**
     * 导出考试分类列表
     */
    @SaCheckPermission("edu:examCategory:export")
    @Log(title = "考试分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(EduExamCategoryBo bo, HttpServletResponse response) {
        List<EduExamCategoryVo> list = eduExamCategoryService.queryList(bo);
        ExcelUtil.exportExcel(list, "考试分类", EduExamCategoryVo.class, response);
    }

    /**
     * 获取考试分类详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("edu:examCategory:query")
    @GetMapping("/{id}")
    public R<EduExamCategoryVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(eduExamCategoryService.queryById(id));
    }

    /**
     * 新增考试分类
     */
    @SaCheckPermission("edu:examCategory:add")
    @Log(title = "考试分类", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody EduExamCategoryBo bo) {
        return toAjax(eduExamCategoryService.insertByBo(bo));
    }

    /**
     * 修改考试分类
     */
    @SaCheckPermission("edu:examCategory:edit")
    @Log(title = "考试分类", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody EduExamCategoryBo bo) {
        return toAjax(eduExamCategoryService.updateByBo(bo));
    }

    /**
     * 删除考试分类
     *
     * @param ids 主键串
     */
    @SaCheckPermission("edu:examCategory:remove")
    @Log(title = "考试分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(eduExamCategoryService.deleteWithValidByIds(List.of(ids), true));
    }
}
