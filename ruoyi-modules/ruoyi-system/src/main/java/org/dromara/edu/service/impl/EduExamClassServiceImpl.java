package org.dromara.edu.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.edu.domain.EduExam;
import org.dromara.edu.domain.EduExamClass;
import org.dromara.edu.domain.vo.EduExamClassVo;
import org.dromara.edu.mapper.EduExamClassMapper;
import org.dromara.edu.mapper.EduExamMapper;
import org.dromara.edu.service.IEduExamClassService;
import org.dromara.system.domain.SysDept;
import org.dromara.system.mapper.SysDeptMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 考试班级关联Service业务层处理
 *
 * @author eezd
 * @date 2025-10-11
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class EduExamClassServiceImpl implements IEduExamClassService {

    private final EduExamClassMapper baseMapper;

    private final EduExamMapper examMapper;

    private final SysDeptMapper deptMapper;

    /**
     * 查询考试班级关联
     *
     * @param examId 主键
     * @return 考试班级关联
     */
    @Override
    public EduExamClassVo queryById(Long examId) {
        // 查询考试信息
        EduExam exam = examMapper.selectById(examId);
        if (exam == null) {
            return null;
        }

        // 查询考试对应的班级记录
        List<EduExamClass> classList = baseMapper.selectList(
            Wrappers.<EduExamClass>lambdaQuery().eq(EduExamClass::getExamId, examId)
        );
        if (CollUtil.isEmpty(classList)) {
            return null;
        }

        // 单独获取所有部门ID
        List<Long> deptIds = classList.stream()
            .map(EduExamClass::getDeptId)
            .filter(Objects::nonNull)
            .distinct()
            .toList();

        // 批量查询部门信息
        List<SysDept> deptList = deptMapper.selectBatchIds(deptIds);
        Map<Long, SysDept> deptMap = deptList.stream()
            .collect(Collectors.toMap(SysDept::getDeptId, Function.identity()));

        // 组装部门/班级信息
        List<EduExamClassVo.DeptInfo> deptInfoList = classList.stream()
            .map(item -> deptMap.get(item.getDeptId()))
            .filter(Objects::nonNull)
            .map(sysDept -> {
                EduExamClassVo.DeptInfo deptInfo = new EduExamClassVo.DeptInfo();
                deptInfo.setDeptId(sysDept.getDeptId());
                deptInfo.setDeptName(sysDept.getDeptName());
                return deptInfo;
            })
            .toList();

        EduExamClassVo result = new EduExamClassVo();
        result.setExamId(examId);
        result.setExamName(exam.getExamName());
        result.setDeptList(deptInfoList);

        return result;
    }

    /**
     * 新增考试班级关联
     *
     * @param eduExamClass 考试班级关联
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(EduExamClass eduExamClass) {
        return baseMapper.insert(eduExamClass) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(EduExamClass entity) {
        // TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除考试班级关联信息
     *
     * @param examClass
     * @param isValid   是否进行有效性校验
     * @return 是否删除成功
     */
    @Override
    public Boolean deleteWithValidByIds(EduExamClass examClass, Boolean isValid) {
        if (isValid) {
            // TODO 做一些业务上的校验,判断是否需要校验
        }
        LambdaQueryWrapper<EduExamClass> lqw = Wrappers.lambdaQuery();
        lqw.eq(EduExamClass::getExamId, examClass.getExamId())
            .eq(EduExamClass::getDeptId, examClass.getDeptId());
        return baseMapper.delete(lqw) > 0;
    }
}
