package org.dromara.edu.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.dromara.common.core.domain.R;
import org.dromara.common.idempotent.annotation.RepeatSubmit;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.web.core.BaseController;
import org.dromara.edu.domain.EduExamClass;
import org.dromara.edu.domain.vo.EduExamClassVo;
import org.dromara.edu.service.IEduExamClassService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 考试班级关联
 *
 * @author eezd
 * @date 2025-10-11
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/edu/examClass")
public class EduExamClassController extends BaseController {

    private final IEduExamClassService eduExamClassService;

    /**
     * 获取考试班级关联详细信息
     *
     * @param examId 主键
     */
    @SaCheckPermission("edu:examClass:query")
    @GetMapping("/{examId}")
    public R<EduExamClassVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long examId) {
        return R.ok(eduExamClassService.queryById(examId));
    }

    /**
     * 新增考试班级关联
     */
    @SaCheckPermission("edu:examClass:add")
    @Log(title = "考试班级关联", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@RequestParam() Long examId,
                       @RequestParam() Long deptId) {
        EduExamClass eduExamClass = new EduExamClass();
        eduExamClass.setExamId(examId);
        eduExamClass.setDeptId(deptId);
        return toAjax(eduExamClassService.insertByBo(eduExamClass));
    }

    /**
     * 删除考试班级关联
     *
     * @param examId 主键
     * @param deptId 主键
     */
    @SaCheckPermission("edu:examClass:remove")
    @Log(title = "考试班级关联", businessType = BusinessType.DELETE)
    @DeleteMapping
    public R<Void> remove(@RequestParam() Long examId,
                          @RequestParam() Long deptId) {
        EduExamClass eduExamClass = new EduExamClass();
        eduExamClass.setExamId(examId);
        eduExamClass.setDeptId(deptId);
        return toAjax(eduExamClassService.deleteWithValidByIds(eduExamClass, true));
    }
}
