package org.dromara.edu.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Update;
import org.dromara.common.core.domain.R;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.web.core.BaseController;
import org.dromara.edu.domain.EduExamResult;
import org.dromara.edu.domain.bo.EduExamBo;
import org.dromara.edu.domain.vo.EduExamResultSubmitVo;
import org.dromara.edu.domain.vo.EduExamVo;
import org.dromara.edu.service.IEduExamResultService;
import org.dromara.edu.service.IEduExamService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 学生端-考试信息
 *
 * @author eezd
 * @date 2025-10-04
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/edu/StudentExam")
public class EduStudentExamController extends BaseController {

    private final IEduExamService eduExamService;

    private final IEduExamResultService eduExamResultService;

    /**
     * 开始考试
     */
    @PostMapping("/start")
    public R<EduExamResult> start(@RequestParam Long examId, @RequestParam String ua) throws JsonProcessingException {
        return R.ok(eduExamResultService.startExam(examId, ua));
    }

    /**
     * 考试交卷
     */
    @PostMapping("/resultSubmit")
    public R<Void> resultSubmit(@Validated(Update.class) @RequestBody EduExamResultSubmitVo eduExamResultSubmitVo) {
        return toAjax(eduExamResultService.resultSubmit(eduExamResultSubmitVo));
    }

    /**
     * 学生端-查询考试信息列表
     */
    @GetMapping("/list")
    public TableDataInfo<EduExamVo> list(EduExamBo bo, PageQuery pageQuery) {
        return eduExamService.queryPageList(bo, pageQuery);
    }
}
