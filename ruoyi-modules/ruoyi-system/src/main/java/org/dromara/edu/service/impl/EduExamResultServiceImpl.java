package org.dromara.edu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.utils.MapstructUtils;
import org.dromara.common.core.utils.ServletUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.satoken.utils.LoginHelper;
import org.dromara.edu.constant.EduConstant;
import org.dromara.edu.domain.EduExam;
import org.dromara.edu.domain.EduExamResult;
import org.dromara.edu.domain.EduQuestion;
import org.dromara.edu.domain.bo.EduExamResultBo;
import org.dromara.edu.domain.vo.EduExamQuestionVo;
import org.dromara.edu.domain.vo.EduExamResultSubmitVo;
import org.dromara.edu.domain.vo.EduExamResultVo;
import org.dromara.edu.mapper.EduExamMapper;
import org.dromara.edu.mapper.EduExamResultMapper;
import org.dromara.edu.mapper.EduQuestionMapper;
import org.dromara.edu.service.IEduExamResultService;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 考试结果Service业务层处理
 *
 * @author eezd
 * @date 2025-10-19
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class EduExamResultServiceImpl implements IEduExamResultService {

    private final EduExamResultMapper baseMapper;

    private final EduExamMapper eduExamMapper;

    private final EduQuestionMapper eduQuestionMapper;

    /**
     * 查询考试结果
     *
     * @param id 主键
     * @return 考试结果
     */
    @Override
    public EduExamResultVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询考试结果列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 考试结果分页列表
     */
    @Override
    public TableDataInfo<EduExamResultVo> queryPageList(EduExamResultBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<EduExamResult> lqw = buildQueryWrapper(bo);
        Page<EduExamResultVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的考试结果列表
     *
     * @param bo 查询条件
     * @return 考试结果列表
     */
    @Override
    public List<EduExamResultVo> queryList(EduExamResultBo bo) {
        LambdaQueryWrapper<EduExamResult> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<EduExamResult> buildQueryWrapper(EduExamResultBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<EduExamResult> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(EduExamResult::getId);
        lqw.eq(bo.getExamId() != null, EduExamResult::getExamId, bo.getExamId());
        lqw.eq(bo.getStudentId() != null, EduExamResult::getStudentId, bo.getStudentId());
        lqw.eq(bo.getStartTime() != null, EduExamResult::getStartTime, bo.getStartTime());
        lqw.eq(bo.getSubmitTime() != null, EduExamResult::getSubmitTime, bo.getSubmitTime());
        lqw.eq(bo.getExamTime() != null, EduExamResult::getExamTime, bo.getExamTime());
        lqw.eq(bo.getTotalScore() != null, EduExamResult::getTotalScore, bo.getTotalScore());
        lqw.eq(bo.getUserScore() != null, EduExamResult::getUserScore, bo.getUserScore());
        lqw.eq(bo.getQuestionCount() != null, EduExamResult::getQuestionCount, bo.getQuestionCount());
        lqw.eq(bo.getCorrectCount() != null, EduExamResult::getCorrectCount, bo.getCorrectCount());
        lqw.eq(bo.getWrongCount() != null, EduExamResult::getWrongCount, bo.getWrongCount());
        lqw.eq(StringUtils.isNotBlank(bo.getAnswerSnapshot()), EduExamResult::getAnswerSnapshot, bo.getAnswerSnapshot());
        lqw.eq(StringUtils.isNotBlank(bo.getIsSubmit()), EduExamResult::getIsSubmit, bo.getIsSubmit());
        lqw.eq(StringUtils.isNotBlank(bo.getClientIp()), EduExamResult::getClientIp, bo.getClientIp());
        lqw.eq(StringUtils.isNotBlank(bo.getUserAgent()), EduExamResult::getUserAgent, bo.getUserAgent());
        return lqw;
    }

    /**
     * 新增考试结果
     *
     * @param bo 考试结果
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(EduExamResultBo bo) {
        EduExamResult add = MapstructUtils.convert(bo, EduExamResult.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改考试结果
     *
     * @param bo 考试结果
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(EduExamResultBo bo) {
        EduExamResult update = MapstructUtils.convert(bo, EduExamResult.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(EduExamResult entity) {
        // TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除考试结果信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            // TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteByIds(ids) > 0;
    }


    /**
     * WEB端开始考试
     *
     * @param examId 考试ID
     * @param ua     浏览器UA信息
     * @return
     */
    @Override
    public EduExamResult startExam(Long examId, String ua) throws JsonProcessingException {
        EduExam eduExam = eduExamMapper.selectById(examId);
        if (eduExam == null) {
            throw new IllegalArgumentException("考试不存在");
        }

        EduExamResult isSubmit = baseMapper.selectOne(
            Wrappers.lambdaQuery(EduExamResult.class)
                .eq(EduExamResult::getStudentId, LoginHelper.getUserId())
                .eq(EduExamResult::getExamId, examId)
                .eq(EduExamResult::getIsSubmit, EduConstant.EXAM_IS_SUBMIT)
        );

        EduExamResult eduExamResult = baseMapper.selectOne(
            Wrappers.lambdaQuery(EduExamResult.class)
                .eq(EduExamResult::getStudentId, LoginHelper.getUserId())
                .eq(EduExamResult::getExamId, examId)
                .eq(EduExamResult::getIsSubmit, EduConstant.EXAM_IS_NOT_SUBMIT)
        );

        if (eduExamResult == null) {
            eduExamResult = new EduExamResult();
            // 构建题目
            List<EduQuestion> eduQuestions = eduQuestionMapper.selectList(
                Wrappers.lambdaQuery(EduQuestion.class)
                    .eq(EduQuestion::getBankId, eduExam.getBankId())
                    .eq(EduQuestion::getStatus, EduConstant.EDU_STATUS_ENABLE)
            );
            if (eduQuestions == null) {
                throw new IllegalArgumentException("警告! 考试题库为空");
            }
            // 构建题目VO列表
            List<EduExamQuestionVo> examQuestionVoList = eduQuestions.stream().map(q -> {
                EduExamQuestionVo vo = new EduExamQuestionVo();
                vo.setId(String.valueOf(q.getId()));
                vo.setBankId(q.getBankId());
                vo.setQuestionType(q.getQuestionType());
                vo.setQuestionTitle(q.getQuestionTitle());
                vo.setOptions(q.getOptions());
                vo.setDifficulty(q.getDifficulty());
                vo.setScore(q.getScore());
                vo.setChooseAnswer(""); // 初始时为空，学生答题后再更新
                return vo;
            }).collect(Collectors.toList());

            eduExamResult.setExamId(examId);
            eduExamResult.setStudentId(LoginHelper.getUserId());
            eduExamResult.setStartTime(new Date());
            eduExamResult.setExamTime(eduExam.getExamTime());
            eduExamResult.setQuestionCount((long) eduQuestions.size());

            ObjectMapper objectMapper = new ObjectMapper();
            // 将题目列表转成 JSON 字符串
            String jsonSnapshot = objectMapper.writeValueAsString(examQuestionVoList);
            // 存入数据库
            eduExamResult.setAnswerSnapshot(jsonSnapshot);

            eduExamResult.setIsSubmit(EduConstant.EXAM_IS_NOT_SUBMIT);
            eduExamResult.setClientIp(ServletUtils.getClientIP());
            eduExamResult.setUserAgent(ua);

            if (isSubmit != null) {
                eduExamResult.setIsSubmit(EduConstant.EXAM_IS_SUBMIT);
                // throw new IllegalArgumentException("您已经提交过该考试");
            } else {
                baseMapper.insert(eduExamResult);
            }
        } else {
            // 校验是否为当前用户
            if (!Objects.equals(eduExamResult.getStudentId(), LoginHelper.getUserId())) {
                throw new IllegalArgumentException("非法操作");
            }
        }

        return eduExamResult;
    }

    /**
     * 提交考试答卷并评分
     */
    public Boolean resultSubmit(EduExamResultSubmitVo eduExamResultSubmitVo) {
        // 1. 校验答卷是否为空
        if (eduExamResultSubmitVo.getAnswerSnapshot() == null ||
            eduExamResultSubmitVo.getAnswerSnapshot().trim().isEmpty()) {
            throw new IllegalArgumentException("答卷为空");
        }

        // 2. 将答卷JSON转换为EduExamQuestionVo列表
        ObjectMapper objectMapper = new ObjectMapper();
        // 配置ObjectMapper,允许options字段为对象或字符串
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        objectMapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);

        List<EduExamQuestionVo> answerList;
        try {
            // 先解析为JsonNode,手动处理options字段
            JsonNode rootNode = objectMapper.readTree(eduExamResultSubmitVo.getAnswerSnapshot());
            answerList = new ArrayList<>();

            if (rootNode.isArray()) {
                for (JsonNode node : rootNode) {
                    EduExamQuestionVo vo = new EduExamQuestionVo();
                    vo.setId(node.has("id") ? node.get("id").asText() : null);
                    vo.setBankId(node.has("bankId") ? node.get("bankId").asLong() : null);
                    vo.setQuestionType(node.has("questionType") ? node.get("questionType").asText() : null);
                    vo.setQuestionTitle(node.has("questionTitle") ? node.get("questionTitle").asText() : null);
                    vo.setDifficulty(node.has("difficulty") ? node.get("difficulty").asText() : null);
                    vo.setScore(node.has("score") ? node.get("score").asLong() : null);
                    vo.setChooseAnswer(node.has("chooseAnswer") ? node.get("chooseAnswer").asText() : "");

                    // 处理options字段 - 如果是对象则转为JSON字符串,如果已是字符串则直接使用
                    if (node.has("options")) {
                        JsonNode optionsNode = node.get("options");
                        if (optionsNode.isObject() || optionsNode.isArray()) {
                            vo.setOptions(objectMapper.writeValueAsString(optionsNode));
                        } else {
                            vo.setOptions(optionsNode.asText());
                        }
                    }

                    answerList.add(vo);
                }
            }
        } catch (Exception e) {
            throw new IllegalArgumentException("答卷格式错误: " + e.getMessage(), e);
        }

        if (answerList.isEmpty()) {
            throw new IllegalArgumentException("答卷内容为空");
        }

        // 3. 获取所有题目ID
        List<Long> questionIds = answerList.stream()
            .filter(vo -> vo.getId() != null && !vo.getId().isEmpty())
            .map(vo -> Long.valueOf(vo.getId()))
            .collect(Collectors.toList());

        if (questionIds.isEmpty()) {
            throw new IllegalArgumentException("答卷中没有有效的题目ID");
        }

        // 4. 查询题目详情(包含正确答案)
        List<EduQuestion> questionList = eduQuestionMapper.selectList(
            Wrappers.lambdaQuery(EduQuestion.class)
                .in(EduQuestion::getId, questionIds)
        );

        if (questionList == null || questionList.isEmpty()) {
            throw new IllegalArgumentException("题目数据不存在");
        }

        // 5. 构建题目ID到题目对象的映射,方便查找
        Map<Long, EduQuestion> questionMap = questionList.stream()
            .collect(Collectors.toMap(EduQuestion::getId, q -> q));

        // 6. 初始化统计变量
        long totalScore = 0L;      // 试卷总分
        long userScore = 0L;       // 用户得分
        long questionCount = answerList.size();  // 题目总数
        long correctCount = 0L;    // 正确题目数
        long wrongCount = 0L;      // 错误题目数

        // 7. 遍历答卷,判断每道题的正确性并计分
        for (EduExamQuestionVo answerVo : answerList) {
            if (answerVo.getId() == null || answerVo.getId().isEmpty()) {
                continue;
            }

            Long questionId = Long.valueOf(answerVo.getId());
            EduQuestion question = questionMap.get(questionId);

            if (question == null) {
                // 题目不存在,跳过
                continue;
            }

            // 累加试卷总分
            totalScore += question.getScore();

            // 获取学生答案和正确答案
            String studentAnswer = answerVo.getChooseAnswer();
            String correctAnswer = question.getCorrectAnswer();

            // 判断答案是否正确
            boolean isCorrect = checkAnswer(studentAnswer, correctAnswer, question.getQuestionType());

            if (isCorrect) {
                // 答对了,加分
                userScore += question.getScore();
                correctCount++;
            } else {
                // 答错了
                wrongCount++;
            }
        }

        // 8. 更新考试结果
        EduExamResult examResult = baseMapper.selectById(eduExamResultSubmitVo.getId());
        if (examResult == null) {
            throw new IllegalArgumentException("考试记录不存在");
        }

        // 校验是否为当前用户
        if (!Objects.equals(examResult.getStudentId(), LoginHelper.getUserId())) {
            throw new IllegalArgumentException("非法操作");
        }

        // 校验是否已提交
        if (EduConstant.EXAM_IS_SUBMIT.equals(examResult.getIsSubmit())) {
            throw new IllegalArgumentException("考试已提交,请勿重复提交");
        }

        String finalAnswerSnapshot;
        try {
            finalAnswerSnapshot = objectMapper.writeValueAsString(answerList);
        } catch (Exception e) {
            throw new IllegalArgumentException("答卷序列化失败: " + e.getMessage(), e);
        }
        // 更新考试结果
        examResult.setAnswerSnapshot(finalAnswerSnapshot);
        examResult.setTotalScore(totalScore);
        examResult.setUserScore(userScore);
        examResult.setQuestionCount(questionCount);
        examResult.setCorrectCount(correctCount);
        examResult.setWrongCount(wrongCount);
        examResult.setIsSubmit(EduConstant.EXAM_IS_SUBMIT);
        examResult.setSubmitTime(new Date());

        return baseMapper.updateById(examResult) > 0;
    }

    /**
     * 判断答案是否正确
     *
     * @param studentAnswer 学生答案
     * @param correctAnswer 正确答案
     * @param questionType  题目类型(1-单选 2-多选 3-判断)
     * @return 是否正确
     */
    private boolean checkAnswer(String studentAnswer, String correctAnswer, String questionType) {
        // 如果学生未作答,则判定为错误
        if (studentAnswer == null || studentAnswer.trim().isEmpty()) {
            return false;
        }

        // 如果正确答案为空,则无法判断
        if (correctAnswer == null || correctAnswer.trim().isEmpty()) {
            return false;
        }

        // 统一转换为大写并去除首尾空格
        studentAnswer = studentAnswer.trim().toUpperCase();
        correctAnswer = correctAnswer.trim().toUpperCase();

        // 根据题目类型判断
        if ("2".equals(questionType)) {
            // 多选题:需要将答案拆分并排序后比较
            String[] studentAnswers = studentAnswer.split("[,，、]");
            String[] correctAnswers = correctAnswer.split("[,，、]");

            // 去除每个选项的空格
            for (int i = 0; i < studentAnswers.length; i++) {
                studentAnswers[i] = studentAnswers[i].trim();
            }
            for (int i = 0; i < correctAnswers.length; i++) {
                correctAnswers[i] = correctAnswers[i].trim();
            }

            // 排序
            Arrays.sort(studentAnswers);
            Arrays.sort(correctAnswers);

            // 比较
            return Arrays.equals(studentAnswers, correctAnswers);
        } else {
            // 单选题或判断题:直接比较
            return studentAnswer.equals(correctAnswer);
        }
    }
}
