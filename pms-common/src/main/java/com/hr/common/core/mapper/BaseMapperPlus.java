package com.hr.common.core.mapper;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.enums.SqlMethod;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.TableInfo;
import com.baomidou.mybatisplus.core.metadata.TableInfoHelper;
import com.baomidou.mybatisplus.core.toolkit.*;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.toolkit.SqlHelper;
import com.hr.common.actable.annotation.Like;
import com.hr.common.actable.utils.CommonUtil;
import com.hr.common.actable.utils.FieldUtils;
import com.hr.common.utils.bean.BeanCopyUtils;
import org.apache.ibatis.binding.MapperMethod;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;

import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 自定义 Mapper 接口, 实现 自定义扩展
 *
 * @param <M> mapper 泛型
 * @param <T> table 泛型
 * @author ruoyi
 * @since 2021-05-13
 */
@SuppressWarnings("unchecked" )
public interface BaseMapperPlus<M, T> extends BaseMapper<T> {

    Log log = LogFactory.getLog(BaseMapperPlus.class);

    int DEFAULT_BATCH_SIZE = 1000;

//    default Class<V> currentVoClass() {
//        return (Class<V>) ReflectionKit.getSuperClassGenericType(this.getClass(), BaseMapperPlus.class, 2);
//    }

    default Class<T> currentModelClass() {
        return (Class<T>) ReflectionKit.getSuperClassGenericType(this.getClass(), BaseMapperPlus.class, 1);
    }

    default Class<M> currentMapperClass() {
        return (Class<M>) ReflectionKit.getSuperClassGenericType(this.getClass(), BaseMapperPlus.class, 0);
    }

    default List<T> selectList() {
        return this.selectList(new QueryWrapper<>());
    }

    default List<T> selectList(T entity) {
        return this.selectList(this.buildWrapper(entity));
    }

    /**
     * 批量插入
     */
    default boolean insertBatch(Collection<T> entityList) {
        return insertBatch(entityList, DEFAULT_BATCH_SIZE);
    }

    /**
     * 批量更新
     */
    default void updateBatchById(Collection<T> entityList) {
        updateBatchById(entityList, DEFAULT_BATCH_SIZE);
    }

    /**
     * 批量插入或更新
     */
    default boolean insertOrUpdateBatch(Collection<T> entityList) {
        return insertOrUpdateBatch(entityList, DEFAULT_BATCH_SIZE);
    }

    /**
     * 批量插入(包含限制条数)
     */
    default boolean insertBatch(Collection<T> entityList, int batchSize) {
        String sqlStatement = SqlHelper.getSqlStatement(this.currentMapperClass(), SqlMethod.INSERT_ONE);
        return SqlHelper.executeBatch(this.currentModelClass(), log, entityList, batchSize,
            (sqlSession, entity) -> sqlSession.insert(sqlStatement, entity));
    }
    /**
     * 批量更新(包含限制条数)
     */
    default boolean updateBatchById(Collection<T> entityList, int batchSize) {
        String sqlStatement = SqlHelper.getSqlStatement(this.currentMapperClass(), SqlMethod.UPDATE_BY_ID);
        return SqlHelper.executeBatch(this.currentModelClass(), log, entityList, batchSize,
            (sqlSession, entity) -> {
                MapperMethod.ParamMap<T> param = new MapperMethod.ParamMap<>();
                param.put(Constants.ENTITY, entity);
                sqlSession.update(sqlStatement, param);
            });
    }

    /**
     * 批量插入或更新(包含限制条数)
     */
    default boolean insertOrUpdateBatch(Collection<T> entityList, int batchSize) {
        TableInfo tableInfo = TableInfoHelper.getTableInfo(this.currentModelClass());
        Assert.notNull(tableInfo, "error: can not execute. because can not find cache of TableInfo for entity!" );
        String keyProperty = tableInfo.getKeyProperty();
        Assert.notEmpty(keyProperty, "error: can not execute. because can not find column for id from entity!" );
        return SqlHelper.saveOrUpdateBatch(this.currentModelClass(), this.currentMapperClass(), log, entityList, batchSize, (sqlSession, entity) -> {
            Object idVal = tableInfo.getPropertyValue(entity, keyProperty);
            String sqlStatement = SqlHelper.getSqlStatement(this.currentMapperClass(), SqlMethod.SELECT_BY_ID);
            return StringUtils.checkValNull(idVal)
                || CollectionUtils.isEmpty(sqlSession.selectList(sqlStatement, entity));
        }, (sqlSession, entity) -> {
            MapperMethod.ParamMap<T> param = new MapperMethod.ParamMap<>();
            param.put(Constants.ENTITY, entity);
            String sqlStatement = SqlHelper.getSqlStatement(this.currentMapperClass(), SqlMethod.UPDATE_BY_ID);
            sqlSession.update(sqlStatement, param);
        });
    }

    /**
     * 插入或更新(包含限制条数)
     */
    default boolean insertOrUpdate(T entity) {
        if (null != entity) {
            TableInfo tableInfo = TableInfoHelper.getTableInfo(this.currentModelClass());
            Assert.notNull(tableInfo, "error: can not execute. because can not find cache of TableInfo for entity!" );
            String keyProperty = tableInfo.getKeyProperty();
            Assert.notEmpty(keyProperty, "error: can not execute. because can not find column for id from entity!" );
            Object idVal = tableInfo.getPropertyValue(entity, tableInfo.getKeyProperty());
            return StringUtils.checkValNull(idVal) || Objects.isNull(selectById((Serializable) idVal)) ? insert(entity) > 0 : updateById(entity) > 0;
        }
        return false;
    }

//    default V selectVoById(Serializable id) {
//        return selectVoById(id, this.currentVoClass());
//    }

    /**
     * 根据 ID 查询
     */
    default <C> C selectVoById(Serializable id, Class<C> voClass) {
        T obj = this.selectById(id);
        if (ObjectUtil.isNull(obj)) {
            return null;
        }
        return BeanCopyUtils.copy(obj, voClass);
    }


    /**
     * 查询（根据ID 批量查询）
     */
    default <C> List<C> selectVoBatchIds(Collection<? extends Serializable> idList, Class<C> voClass) {
        List<T> list = this.selectBatchIds(idList);
        if (CollUtil.isEmpty(list)) {
            return CollUtil.newArrayList();
        }
        return BeanCopyUtils.copyList(list, voClass);
    }

    /**
     * 查询（根据 columnMap 条件）
     */
    default <C> List<C> selectVoByMap(Map<String, Object> map, Class<C> voClass) {
        List<T> list = this.selectByMap(map);
        if (CollUtil.isEmpty(list)) {
            return CollUtil.newArrayList();
        }
        return BeanCopyUtils.copyList(list, voClass);
    }


    /**
     * 根据 entity 条件，查询一条记录
     */
    default <C> C selectVoOne(Wrapper<T> wrapper, Class<C> voClass) {
        T obj = this.selectOne(wrapper);
        if (ObjectUtil.isNull(obj)) {
            return null;
        }
        return BeanCopyUtils.copy(obj, voClass);
    }

    /**
     * 根据 entity 条件，查询全部记录
     */
    default <C> List<C> selectVoList(Wrapper<T> wrapper, Class<C> voClass) {
        List<T> list = this.selectList(wrapper);
        if (CollUtil.isEmpty(list)) {
            return CollUtil.newArrayList();
        }
        return BeanCopyUtils.copyList(list, voClass);
    }


    /**
     * 分页查询VO
     */
    default <C, P extends IPage<C>> P selectVoPage(IPage<T> page, Wrapper<T> wrapper, Class<C> voClass) {
        IPage<T> pageData = this.selectPage(page, wrapper);
        IPage<C> voPage = new Page<>(pageData.getCurrent(), pageData.getSize(), pageData.getTotal());
        if (CollUtil.isEmpty(pageData.getRecords())) {
            return (P) voPage;
        }
        voPage.setRecords(BeanCopyUtils.copyList(pageData.getRecords(), voClass));
        return (P) voPage;
    }

    /**
     * 拼接SQL
     *
     * @param entity 实体
     * @return 查询
     */
    default QueryWrapper<T> buildWrapper(T entity) {
        QueryWrapper<T> wrapper = new QueryWrapper<>();
        for (Field field : FieldUtils.getAllFields(entity)) {
            field.setAccessible(true);
            Annotation[] annotations = field.getAnnotations();
            if (annotations != null && annotations.length > 0) {
                TableField tableField = field.getAnnotation(TableField.class);
                Like like = field.getAnnotation(Like.class);
                if (tableField == null || tableField.exist()) {
                    try {
                        String key = StrUtil.toUnderlineCase(field.getName());
                        Object value = field.get(entity);
                        if (CommonUtil.isNull(value)) {
                            continue;
                        }
                        if (like != null) {
                            wrapper.like(key, value);
                        } else {
                            wrapper.eq(key, value);
                        }
                    } catch (IllegalAccessException e) {
                        log.error("拼接SQL发生错误!" );
                    }
                }
            }
        }
        return wrapper;
    }

}
