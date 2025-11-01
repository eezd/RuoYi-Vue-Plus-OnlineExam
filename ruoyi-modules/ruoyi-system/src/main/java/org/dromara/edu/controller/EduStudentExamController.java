package org.dromara.edu.controller;

import lombok.RequiredArgsConstructor;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.web.core.BaseController;
import org.dromara.edu.domain.bo.EduExamBo;
import org.dromara.edu.domain.vo.EduExamVo;
import org.dromara.edu.service.IEduExamService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

    /**
     * 学生端-查询考试信息列表
     */
    @GetMapping("/list")
    public TableDataInfo<EduExamVo> list(EduExamBo bo, PageQuery pageQuery) {
        return eduExamService.queryPageList(bo, pageQuery);
    }

}
