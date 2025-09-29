package org.dromara.edu.controller;

import java.util.List;

import lombok.RequiredArgsConstructor;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import org.dromara.common.idempotent.annotation.RepeatSubmit;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.web.core.BaseController;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.excel.utils.ExcelUtil;
import org.dromara.edu.domain.vo.EduQuestionBankVo;
import org.dromara.edu.domain.bo.EduQuestionBankBo;
import org.dromara.edu.service.IEduQuestionBankService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 题库
 *
 * @author eezd
 * @date 2025-09-28
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/edu/questionBank")
public class EduQuestionBankController extends BaseController {

    private final IEduQuestionBankService eduQuestionBankService;

    /**
     * 查询题库列表
     */
    @SaCheckPermission("edu:questionBank:list")
    @GetMapping("/list")
    public TableDataInfo<EduQuestionBankVo> list(EduQuestionBankBo bo, PageQuery pageQuery) {
        return eduQuestionBankService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出题库列表
     */
    @SaCheckPermission("edu:questionBank:export")
    @Log(title = "题库", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(EduQuestionBankBo bo, HttpServletResponse response) {
        List<EduQuestionBankVo> list = eduQuestionBankService.queryList(bo);
        ExcelUtil.exportExcel(list, "题库", EduQuestionBankVo.class, response);
    }

    /**
     * 获取题库详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("edu:questionBank:query")
    @GetMapping("/{id}")
    public R<EduQuestionBankVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(eduQuestionBankService.queryById(id));
    }

    /**
     * 新增题库
     */
    @SaCheckPermission("edu:questionBank:add")
    @Log(title = "题库", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody EduQuestionBankBo bo) {
        return toAjax(eduQuestionBankService.insertByBo(bo));
    }

    /**
     * 修改题库
     */
    @SaCheckPermission("edu:questionBank:edit")
    @Log(title = "题库", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody EduQuestionBankBo bo) {
        return toAjax(eduQuestionBankService.updateByBo(bo));
    }

    /**
     * 删除题库
     *
     * @param ids 主键串
     */
    @SaCheckPermission("edu:questionBank:remove")
    @Log(title = "题库", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(eduQuestionBankService.deleteWithValidByIds(List.of(ids), true));
    }
}
