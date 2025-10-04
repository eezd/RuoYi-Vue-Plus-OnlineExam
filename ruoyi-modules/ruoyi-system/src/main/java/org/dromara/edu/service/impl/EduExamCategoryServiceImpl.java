package org.dromara.edu.service.impl;

import org.dromara.common.core.utils.MapstructUtils;
import org.dromara.common.core.utils.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.dromara.edu.domain.bo.EduExamCategoryBo;
import org.dromara.edu.domain.vo.EduExamCategoryVo;
import org.dromara.edu.domain.EduExamCategory;
import org.dromara.edu.mapper.EduExamCategoryMapper;
import org.dromara.edu.service.IEduExamCategoryService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 考试分类Service业务层处理
 *
 * @author eezd
 * @date 2025-10-04
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class EduExamCategoryServiceImpl implements IEduExamCategoryService {

    private final EduExamCategoryMapper baseMapper;

    /**
     * 查询考试分类
     *
     * @param id 主键
     * @return 考试分类
     */
    @Override
    public EduExamCategoryVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }


    /**
     * 查询符合条件的考试分类列表
     *
     * @param bo 查询条件
     * @return 考试分类列表
     */
    @Override
    public List<EduExamCategoryVo> queryList(EduExamCategoryBo bo) {
        LambdaQueryWrapper<EduExamCategory> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<EduExamCategory> buildQueryWrapper(EduExamCategoryBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<EduExamCategory> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(EduExamCategory::getId);
        lqw.eq(bo.getParentId() != null, EduExamCategory::getParentId, bo.getParentId());
        lqw.like(StringUtils.isNotBlank(bo.getCategoryName()), EduExamCategory::getCategoryName, bo.getCategoryName());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), EduExamCategory::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增考试分类
     *
     * @param bo 考试分类
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(EduExamCategoryBo bo) {
        EduExamCategory add = MapstructUtils.convert(bo, EduExamCategory.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改考试分类
     *
     * @param bo 考试分类
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(EduExamCategoryBo bo) {
        EduExamCategory update = MapstructUtils.convert(bo, EduExamCategory.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(EduExamCategory entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除考试分类信息
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
