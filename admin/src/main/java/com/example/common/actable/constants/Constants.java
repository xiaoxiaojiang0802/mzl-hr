package com.example.common.actable.constants;

/**
 * @author xiaojiang
 */
public class Constants {

    public static final String DATABASE_TYPE_KEY = "mybatis.database.type";
    public static final String MODEL_PACK_KEY = "mybatis.model.pack";
    public static final String TABLE_AUTO_KEY = "mybatis.table.auto";

    public static final String DATABASE_TYPE_KEY_VALUE = "${mybatis.database.type:NULL}";
    public static final String MODEL_PACK_KEY_VALUE = "${mybatis.model.pack:NULL}";
    public static final String TABLE_AUTO_KEY_VALUE = "${mybatis.table.auto:NULL}";

    public static final String ACTABLE_DATABASE_TYPE_KEY = "actable.database.type";
    public static final String ACTABLE_MODEL_PACK_KEY = "actable.model.pack";
    public static final String ACTABLE_TABLE_AUTO_KEY = "actable.table.auto";

    public static final String ACTABLE_DATABASE_TYPE_KEY_VALUE = "${actable.database.type:NULL}";
    public static final String ACTABLE_MODEL_PACK_KEY_VALUE = "${actable.model.pack:NULL}";
    public static final String ACTABLE_TABLE_AUTO_KEY_VALUE = "${actable.table.auto:NULL}";

    public static final String NULL = "NULL";

    public static final String NEW_TABLE_MAP = "newTableMap";
    public static final String MODIFY_TABLE_MAP = "modifyTableMap";
    public static final String ADD_TABLE_MAP = "addTableMap";
    public static final String REMOVE_TABLE_MAP = "removeTableMap";
    public static final String MODIFY_TABLE_PROPERTY_MAP = "modifyTablePropertyMap";
    public static final String DROPKEY_TABLE_MAP = "dropKeyTableMap";
    public static final String DROPINDEXANDUNIQUE_TABLE_MAP = "dropIndexAndUniqueTableMap";
    public static final String ADDINDEX_TABLE_MAP = "addIndexTableMap";
    public static final String ADDUNIQUE_TABLE_MAP = "addUniqueTableMap";

    public static final String TABLE_INDEX_KEY = "actable.index.prefix";
    public static final String TABLE_UNIQUE_KEY = "actable.unique.prefix";

    public static final String TABLE_INDEX_KEY_VALUE = "${actable.index.prefix:actable_idx_}";
    public static final String TABLE_UNIQUE_KEY_VALUE = "${actable.unique.prefix:actable_uni_}";

    public static final int BEFORE_CHECK= 1;
    public static final int REAL_CHECK= 2;
    public static final int RECHECK= 3;
    public static final int AFTER_CHECK= 4;
    public static final int DAILY_CALIBRATE= 5;
    public static final int QUARTER_CHECK= 6;
    public static final int QUARTER_CALIBRATE = 7;
}
