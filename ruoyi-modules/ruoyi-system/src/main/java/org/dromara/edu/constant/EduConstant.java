package org.dromara.edu.constant;

/**
 * 在线考试系统常见常量
 */
public interface EduConstant {

    /**
     * =========================
     * 基本状态
     * =========================
     */
    String EDU_STATUS_DISPLAY = "1"; // 停用
    String EDU_STATUS_ENABLE = "0";  // 启用

    /**
     * =========================
     * 交卷状态（0未交卷 1已交卷）
     * =========================
     */
    String EXAM_IS_SUBMIT = "1"; // 未交卷
    String EXAM_IS_NOT_SUBMIT = "0";  // 已交卷


    /**
     * =========================
     * 题目类型（1-单选 2-多选 3-判断）
     * =========================
     */
    String QUESTION_TYPE_SINGLE = "1";   // 单选题
    String QUESTION_TYPE_MULTIPLE = "2"; // 多选题
    String QUESTION_TYPE_JUDGE = "3";    // 判断题


    /**
     * =========================
     * 难度等级（1-简单 2-中等 3-困难）
     * =========================
     */
    String DIFFICULTY_LEVEL_EASY = "1";   // 简单
    String DIFFICULTY_LEVEL_MEDIUM = "2"; // 中等
    String DIFFICULTY_LEVEL_HARD = "3";   // 困难
}
