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
import org.dromara.edu.domain.vo.EduQuestionVo;
import org.dromara.edu.domain.bo.EduQuestionBo;
import org.dromara.edu.service.IEduQuestionService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 试题
 *
 * @author eezd
 * @date 2025-10-03
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/edu/question")
public class EduQuestionController extends BaseController {

    private final IEduQuestionService eduQuestionService;

    /**
     * 查询试题列表
     */
    @SaCheckPermission("edu:question:list")
    @GetMapping("/list")
    public TableDataInfo<EduQuestionVo> list(EduQuestionBo bo, PageQuery pageQuery) {
        return eduQuestionService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出试题列表
     */
    @SaCheckPermission("edu:question:export")
    @Log(title = "试题", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(EduQuestionBo bo, HttpServletResponse response) {
        List<EduQuestionVo> list = eduQuestionService.queryList(bo);
        ExcelUtil.exportExcel(list, "试题", EduQuestionVo.class, response);
    }

    /**
     * 获取试题详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("edu:question:query")
    @GetMapping("/{id}")
    public R<EduQuestionVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(eduQuestionService.queryById(id));
    }

    /**
     * 新增试题
     */
    @SaCheckPermission("edu:question:add")
    @Log(title = "试题", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody EduQuestionBo bo) {
        return toAjax(eduQuestionService.insertByBo(bo));
    }

    /**
     * 修改试题
     */
    @SaCheckPermission("edu:question:edit")
    @Log(title = "试题", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody EduQuestionBo bo) {
        return toAjax(eduQuestionService.updateByBo(bo));
    }

    /**
     * 删除试题
     *
     * @param ids 主键串
     */
    @SaCheckPermission("edu:question:remove")
    @Log(title = "试题", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(eduQuestionService.deleteWithValidByIds(List.of(ids), true));
    }
}
