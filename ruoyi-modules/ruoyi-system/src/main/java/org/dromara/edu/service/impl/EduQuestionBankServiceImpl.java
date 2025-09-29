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
import org.dromara.edu.domain.bo.EduQuestionBankBo;
import org.dromara.edu.domain.vo.EduQuestionBankVo;
import org.dromara.edu.domain.EduQuestionBank;
import org.dromara.edu.mapper.EduQuestionBankMapper;
import org.dromara.edu.service.IEduQuestionBankService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 题库Service业务层处理
 *
 * @author eezd
 * @date 2025-09-28
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class EduQuestionBankServiceImpl implements IEduQuestionBankService {

    private final EduQuestionBankMapper baseMapper;

    /**
     * 查询题库
     *
     * @param id 主键
     * @return 题库
     */
    @Override
    public EduQuestionBankVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询题库列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 题库分页列表
     */
    @Override
    public TableDataInfo<EduQuestionBankVo> queryPageList(EduQuestionBankBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<EduQuestionBank> lqw = buildQueryWrapper(bo);
        Page<EduQuestionBankVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的题库列表
     *
     * @param bo 查询条件
     * @return 题库列表
     */
    @Override
    public List<EduQuestionBankVo> queryList(EduQuestionBankBo bo) {
        LambdaQueryWrapper<EduQuestionBank> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<EduQuestionBank> buildQueryWrapper(EduQuestionBankBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<EduQuestionBank> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(EduQuestionBank::getId);
        lqw.like(StringUtils.isNotBlank(bo.getBankName()), EduQuestionBank::getBankName, bo.getBankName());
        lqw.eq(StringUtils.isNotBlank(bo.getBankDesc()), EduQuestionBank::getBankDesc, bo.getBankDesc());
        lqw.eq(bo.getCategoryId() != null, EduQuestionBank::getCategoryId, bo.getCategoryId());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), EduQuestionBank::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增题库
     *
     * @param bo 题库
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(EduQuestionBankBo bo) {
        EduQuestionBank add = MapstructUtils.convert(bo, EduQuestionBank.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改题库
     *
     * @param bo 题库
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(EduQuestionBankBo bo) {
        EduQuestionBank update = MapstructUtils.convert(bo, EduQuestionBank.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(EduQuestionBank entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除题库信息
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
