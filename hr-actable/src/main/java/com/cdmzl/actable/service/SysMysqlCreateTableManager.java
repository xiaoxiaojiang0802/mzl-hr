package com.cdmzl.actable.service;


import java.util.List;

/**
 * @author sunchenbin
 * @version 2016年6月23日 下午6:07:21
 */
public interface SysMysqlCreateTableManager {

    void createMysqlTable();

    List<Object> getAllFields(Class<?> clas);

}
