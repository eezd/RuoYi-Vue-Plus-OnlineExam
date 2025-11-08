package org.dromara.edu.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.excel.utils.ExcelUtil;
import org.dromara.common.idempotent.annotation.RepeatSubmit;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.web.core.BaseController;
import org.dromara.edu.domain.bo.EduExamResultBo;
import org.dromara.edu.domain.bo.EdutStudentExamResultBo;
import org.dromara.edu.domain.vo.EduExamResultVo;
import org.dromara.edu.domain.vo.EduStudentExamResultVo;
import org.dromara.edu.service.IEduExamResultService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 考试结果
 *
 * @author eezd
 * @date 2025-10-19
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/edu/examResult")
public class EduExamResultController extends BaseController {

    private final IEduExamResultService eduExamResultService;

    /**
     * 查询考试结果列表
     */
    @SaCheckPermission("edu:examResult:list")
    @GetMapping("/list")
    public TableDataInfo<EduStudentExamResultVo> list(EdutStudentExamResultBo bo, PageQuery pageQuery) {
        return eduExamResultService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出考试结果列表
     */
    @SaCheckPermission("edu:examResult:export")
    @Log(title = "考试结果", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(EduExamResultBo bo, HttpServletResponse response) {
        List<EduExamResultVo> list = eduExamResultService.queryList(bo);
        ExcelUtil.exportExcel(list, "考试结果", EduExamResultVo.class, response);
    }

    /**
     * 获取考试结果详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("edu:examResult:query")
    @GetMapping("/{id}")
    public R<EduExamResultVo> getInfo(@NotNull(message = "主键不能为空")
                                      @PathVariable Long id) {
        return R.ok(eduExamResultService.queryById(id));
    }

    /**
     * 新增考试结果
     */
    @SaCheckPermission("edu:examResult:add")
    @Log(title = "考试结果", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody EduExamResultBo bo) {
        return toAjax(eduExamResultService.insertByBo(bo));
    }

    /**
     * 修改考试结果
     */
    @SaCheckPermission("edu:examResult:edit")
    @Log(title = "考试结果", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody EduExamResultBo bo) {
        return toAjax(eduExamResultService.updateByBo(bo));
    }

    /**
     * 删除考试结果
     *
     * @param ids 主键串
     */
    @SaCheckPermission("edu:examResult:remove")
    @Log(title = "考试结果", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(eduExamResultService.deleteWithValidByIds(List.of(ids), true));
    }
}
