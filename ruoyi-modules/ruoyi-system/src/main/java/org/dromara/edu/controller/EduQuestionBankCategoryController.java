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
import org.dromara.edu.domain.vo.EduQuestionBankCategoryVo;
import org.dromara.edu.domain.bo.EduQuestionBankCategoryBo;
import org.dromara.edu.service.IEduQuestionBankCategoryService;

/**
 * 题库分类
 *
 * @author eezd
 * @date 2025-09-28
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/edu/questionBankCategory")
public class EduQuestionBankCategoryController extends BaseController {

    private final IEduQuestionBankCategoryService eduQuestionBankCategoryService;

    /**
     * 查询题库分类列表
     */
    @SaCheckPermission("edu:questionBankCategory:list")
    @GetMapping("/list")
    public R<List<EduQuestionBankCategoryVo>> list(EduQuestionBankCategoryBo bo) {
        List<EduQuestionBankCategoryVo> list = eduQuestionBankCategoryService.queryList(bo);
        return R.ok(list);
    }

    /**
     * 导出题库分类列表
     */
    @SaCheckPermission("edu:questionBankCategory:export")
    @Log(title = "题库分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(EduQuestionBankCategoryBo bo, HttpServletResponse response) {
        List<EduQuestionBankCategoryVo> list = eduQuestionBankCategoryService.queryList(bo);
        ExcelUtil.exportExcel(list, "题库分类", EduQuestionBankCategoryVo.class, response);
    }

    /**
     * 获取题库分类详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("edu:questionBankCategory:query")
    @GetMapping("/{id}")
    public R<EduQuestionBankCategoryVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(eduQuestionBankCategoryService.queryById(id));
    }

    /**
     * 新增题库分类
     */
    @SaCheckPermission("edu:questionBankCategory:add")
    @Log(title = "题库分类", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody EduQuestionBankCategoryBo bo) {
        return toAjax(eduQuestionBankCategoryService.insertByBo(bo));
    }

    /**
     * 修改题库分类
     */
    @SaCheckPermission("edu:questionBankCategory:edit")
    @Log(title = "题库分类", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody EduQuestionBankCategoryBo bo) {
        return toAjax(eduQuestionBankCategoryService.updateByBo(bo));
    }

    /**
     * 删除题库分类
     *
     * @param ids 主键串
     */
    @SaCheckPermission("edu:questionBankCategory:remove")
    @Log(title = "题库分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(eduQuestionBankCategoryService.deleteWithValidByIds(List.of(ids), true));
    }
}
