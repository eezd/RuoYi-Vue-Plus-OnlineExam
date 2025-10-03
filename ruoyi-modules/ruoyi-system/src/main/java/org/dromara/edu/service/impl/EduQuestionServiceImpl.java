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
import org.dromara.edu.domain.bo.EduQuestionBo;
import org.dromara.edu.domain.vo.EduQuestionVo;
import org.dromara.edu.domain.EduQuestion;
import org.dromara.edu.mapper.EduQuestionMapper;
import org.dromara.edu.service.IEduQuestionService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 试题Service业务层处理
 *
 * @author eezd
 * @date 2025-10-03
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class EduQuestionServiceImpl implements IEduQuestionService {

    private final EduQuestionMapper baseMapper;

    /**
     * 查询试题
     *
     * @param id 主键
     * @return 试题
     */
    @Override
    public EduQuestionVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询试题列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 试题分页列表
     */
    @Override
    public TableDataInfo<EduQuestionVo> queryPageList(EduQuestionBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<EduQuestion> lqw = buildQueryWrapper(bo);
        Page<EduQuestionVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的试题列表
     *
     * @param bo 查询条件
     * @return 试题列表
     */
    @Override
    public List<EduQuestionVo> queryList(EduQuestionBo bo) {
        LambdaQueryWrapper<EduQuestion> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<EduQuestion> buildQueryWrapper(EduQuestionBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<EduQuestion> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(EduQuestion::getId);
        lqw.eq(bo.getBankId() != null, EduQuestion::getBankId, bo.getBankId());
        lqw.eq(StringUtils.isNotBlank(bo.getQuestionType()), EduQuestion::getQuestionType, bo.getQuestionType());
        lqw.like(StringUtils.isNotBlank(bo.getQuestionTitle()), EduQuestion::getQuestionTitle, bo.getQuestionTitle());
        lqw.eq(StringUtils.isNotBlank(bo.getDifficulty()), EduQuestion::getDifficulty, bo.getDifficulty());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), EduQuestion::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增试题
     *
     * @param bo 试题
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(EduQuestionBo bo) {
        EduQuestion add = MapstructUtils.convert(bo, EduQuestion.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改试题
     *
     * @param bo 试题
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(EduQuestionBo bo) {
        EduQuestion update = MapstructUtils.convert(bo, EduQuestion.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(EduQuestion entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除试题信息
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
