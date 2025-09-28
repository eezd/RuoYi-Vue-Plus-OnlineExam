package org.dromara.edu.service.impl;

import org.dromara.common.core.utils.MapstructUtils;
import org.dromara.common.core.utils.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.dromara.edu.domain.bo.EduQuestionBankCategoryBo;
import org.dromara.edu.domain.vo.EduQuestionBankCategoryVo;
import org.dromara.edu.domain.EduQuestionBankCategory;
import org.dromara.edu.mapper.EduQuestionBankCategoryMapper;
import org.dromara.edu.service.IEduQuestionBankCategoryService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 题库分类Service业务层处理
 *
 * @author eezd
 * @date 2025-09-28
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class EduQuestionBankCategoryServiceImpl implements IEduQuestionBankCategoryService {

    private final EduQuestionBankCategoryMapper baseMapper;

    /**
     * 查询题库分类
     *
     * @param id 主键
     * @return 题库分类
     */
    @Override
    public EduQuestionBankCategoryVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }


    /**
     * 查询符合条件的题库分类列表
     *
     * @param bo 查询条件
     * @return 题库分类列表
     */
    @Override
    public List<EduQuestionBankCategoryVo> queryList(EduQuestionBankCategoryBo bo) {
        LambdaQueryWrapper<EduQuestionBankCategory> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<EduQuestionBankCategory> buildQueryWrapper(EduQuestionBankCategoryBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<EduQuestionBankCategory> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(EduQuestionBankCategory::getId);
        lqw.like(StringUtils.isNotBlank(bo.getCategoryName()), EduQuestionBankCategory::getCategoryName, bo.getCategoryName());
        return lqw;
    }

    /**
     * 新增题库分类
     *
     * @param bo 题库分类
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(EduQuestionBankCategoryBo bo) {
        EduQuestionBankCategory add = MapstructUtils.convert(bo, EduQuestionBankCategory.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改题库分类
     *
     * @param bo 题库分类
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(EduQuestionBankCategoryBo bo) {
        EduQuestionBankCategory update = MapstructUtils.convert(bo, EduQuestionBankCategory.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(EduQuestionBankCategory entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除题库分类信息
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
