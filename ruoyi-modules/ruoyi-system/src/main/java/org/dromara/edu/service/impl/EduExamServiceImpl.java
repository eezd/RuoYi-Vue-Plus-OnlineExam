package org.dromara.edu.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.utils.MapstructUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.satoken.utils.LoginHelper;
import org.dromara.edu.domain.EduExam;
import org.dromara.edu.domain.EduExamCategory;
import org.dromara.edu.domain.EduExamClass;
import org.dromara.edu.domain.EduQuestionBank;
import org.dromara.edu.domain.bo.EduExamBo;
import org.dromara.edu.domain.vo.EduExamVo;
import org.dromara.edu.mapper.EduExamCategoryMapper;
import org.dromara.edu.mapper.EduExamClassMapper;
import org.dromara.edu.mapper.EduExamMapper;
import org.dromara.edu.mapper.EduQuestionBankMapper;
import org.dromara.edu.service.IEduExamService;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 考试信息Service业务层处理
 *
 * @author eezd
 * @date 2025-10-04
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class EduExamServiceImpl implements IEduExamService {

    private final EduExamMapper baseMapper;

    private final EduExamClassMapper eduExamClassMapper;

    private final EduExamCategoryMapper eduExamCategoryMapper;

    private final EduQuestionBankMapper eduQuestionBankMapper;

    /**
     * 查询考试信息
     *
     * @param id 主键
     * @return 考试信息
     */
    @Override
    public EduExamVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询考试信息列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 考试信息分页列表
     */
    @Override
    public TableDataInfo<EduExamVo> queryPageList(EduExamBo bo, PageQuery pageQuery) {
        // List<RoleDTO> roles = LoginHelper.getLoginUser().getRoles();
        // boolean isStudent = CollUtil.isNotEmpty(roles) && roles.stream()
        //     .anyMatch(role -> role.getRoleKey() != null && role.getRoleKey().contains("student"));
        // if (isStudent) {
        //     // 当前用户具有 student 角色
        // }
        Long deptId = LoginHelper.getDeptId();
        List<EduExamClass> eduExamClasses = eduExamClassMapper.selectList(
            new LambdaQueryWrapper<>(EduExamClass.class)
                .eq(EduExamClass::getDeptId, deptId)
        );
        List<Long> examIds = eduExamClasses.stream()
            .map(EduExamClass::getExamId)
            .filter(Objects::nonNull)
            .distinct() // 去重，避免重复 ID
            .collect(Collectors.toList());
        // 获取考试列表
        LambdaQueryWrapper<EduExam> lqw = buildQueryWrapper(bo);
        if (CollUtil.isNotEmpty(examIds)) {
            lqw.in(EduExam::getId, examIds);
        } else {
            // 如果没有任何考试ID，返回空结果
            return TableDataInfo.build();
        }

        Page<EduExamVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);

        // 获取所有的 categoryId
        List<Long> categoryIds = result.getRecords().stream()
            .map(EduExamVo::getCategoryId)
            .filter(Objects::nonNull)
            .distinct()
            .collect(Collectors.toList());

        // 批量查询分类信息
        if (CollUtil.isNotEmpty(categoryIds)) {
            List<EduExamCategory> categories = eduExamCategoryMapper.selectByIds(categoryIds);
            // 构建 categoryId -> categoryName 的映射
            Map<Long, String> categoryMap = categories.stream()
                .collect(Collectors.toMap(
                    EduExamCategory::getId,
                    EduExamCategory::getCategoryName
                ));
            // 填充 categoryName
            result.getRecords().forEach(vo -> {
                if (vo.getCategoryId() != null) {
                    vo.setCategoryName(categoryMap.get(vo.getCategoryId()));
                }
            });
        }

        // 题库ID和名称关联
        List<Long> bankIds = result.getRecords().stream()
            .map(EduExamVo::getBankId)
            .filter(Objects::nonNull)
            .distinct()
            .collect(Collectors.toList());
        if (CollUtil.isNotEmpty(bankIds)) {
            List<EduQuestionBank> banks = eduQuestionBankMapper.selectByIds(bankIds);
            Map<Long, String> bankMap = banks.stream()
                .collect(Collectors.toMap(
                    EduQuestionBank::getId,
                    EduQuestionBank::getBankName
                ));
            result.getRecords().forEach(vo -> {
                if (vo.getBankId() != null) {
                    vo.setBankName(bankMap.get(vo.getBankId()));
                }
            });
        }

        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的考试信息列表
     *
     * @param bo 查询条件
     * @return 考试信息列表
     */
    @Override
    public List<EduExamVo> queryList(EduExamBo bo) {
        LambdaQueryWrapper<EduExam> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<EduExam> buildQueryWrapper(EduExamBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<EduExam> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(EduExam::getId);
        lqw.like(StringUtils.isNotBlank(bo.getExamName()), EduExam::getExamName, bo.getExamName());
        lqw.eq(StringUtils.isNotBlank(bo.getExamDesc()), EduExam::getExamDesc, bo.getExamDesc());
        lqw.eq(bo.getCategoryId() != null, EduExam::getCategoryId, bo.getCategoryId());
        lqw.eq(bo.getBankId() != null, EduExam::getBankId, bo.getBankId());
        lqw.eq(bo.getExamTime() != null, EduExam::getExamTime, bo.getExamTime());
        lqw.eq(bo.getStartTime() != null, EduExam::getStartTime, bo.getStartTime());
        lqw.eq(bo.getEndTime() != null, EduExam::getEndTime, bo.getEndTime());
        lqw.eq(StringUtils.isNotBlank(bo.getIsRandom()), EduExam::getIsRandom, bo.getIsRandom());
        lqw.eq(StringUtils.isNotBlank(bo.getAllowReview()), EduExam::getAllowReview, bo.getAllowReview());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), EduExam::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增考试信息
     *
     * @param bo 考试信息
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(EduExamBo bo) {
        EduExam add = MapstructUtils.convert(bo, EduExam.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改考试信息
     *
     * @param bo 考试信息
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(EduExamBo bo) {
        EduExam update = MapstructUtils.convert(bo, EduExam.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(EduExam entity) {
        // TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除考试信息信息
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
}
