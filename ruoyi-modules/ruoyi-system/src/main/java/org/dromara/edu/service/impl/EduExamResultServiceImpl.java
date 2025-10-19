package org.dromara.edu.service.impl;

import org.dromara.common.core.utils.MapstructUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.dromara.edu.domain.bo.EduExamResultBo;
import org.dromara.edu.domain.vo.EduExamResultVo;
import org.dromara.edu.domain.EduExamResult;
import org.dromara.edu.mapper.EduExamResultMapper;
import org.dromara.edu.service.IEduExamResultService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

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

    /**
     * 查询考试结果
     *
     * @param id 主键
     * @return 考试结果
     */
    @Override
    public EduExamResultVo queryById(Long id){
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
    private void validEntityBeforeSave(EduExamResult entity){
        //TODO 做一些数据校验,如唯一约束
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
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteByIds(ids) > 0;
    }
}
