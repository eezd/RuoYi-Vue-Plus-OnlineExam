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
import org.dromara.edu.domain.vo.EduExamVo;
import org.dromara.edu.domain.bo.EduExamBo;
import org.dromara.edu.service.IEduExamService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 考试信息
 *
 * @author eezd
 * @date 2025-10-04
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/edu/exam")
public class EduExamController extends BaseController {

    private final IEduExamService eduExamService;

    /**
     * 查询考试信息列表
     */
    @SaCheckPermission("edu:exam:list")
    @GetMapping("/list")
    public TableDataInfo<EduExamVo> list(EduExamBo bo, PageQuery pageQuery) {
        return eduExamService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出考试信息列表
     */
    @SaCheckPermission("edu:exam:export")
    @Log(title = "考试信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(EduExamBo bo, HttpServletResponse response) {
        List<EduExamVo> list = eduExamService.queryList(bo);
        ExcelUtil.exportExcel(list, "考试信息", EduExamVo.class, response);
    }

    /**
     * 获取考试信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("edu:exam:query")
    @GetMapping("/{id}")
    public R<EduExamVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(eduExamService.queryById(id));
    }

    /**
     * 新增考试信息
     */
    @SaCheckPermission("edu:exam:add")
    @Log(title = "考试信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody EduExamBo bo) {
        return toAjax(eduExamService.insertByBo(bo));
    }

    /**
     * 修改考试信息
     */
    @SaCheckPermission("edu:exam:edit")
    @Log(title = "考试信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody EduExamBo bo) {
        return toAjax(eduExamService.updateByBo(bo));
    }

    /**
     * 删除考试信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("edu:exam:remove")
    @Log(title = "考试信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(eduExamService.deleteWithValidByIds(List.of(ids), true));
    }
}
