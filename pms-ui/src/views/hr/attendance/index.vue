<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
                  <el-form-item label="员工姓名" prop="employeeName">
                    <el-input
                        v-model="queryParams.employeeName"
                        placeholder="请输入员工姓名"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="所属部门" prop="department">
                    <el-input
                        v-model="queryParams.department"
                        placeholder="请输入所属部门"
                        clearable
                        @keyup.enter.native="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="打卡日期" prop="date">
                    <el-date-picker clearable
                                    v-model="queryParams.date"
                                    type="date"
                                    value-format="yyyy-MM-dd"
                                    placeholder="请选择打卡日期">
                    </el-date-picker>
                  </el-form-item>
                  <el-form-item label="打卡开始时间" prop="startTime">
                    <el-date-picker clearable
                                    v-model="queryParams.startTime"
                                    type="date"
                                    value-format="yyyy-MM-dd"
                                    placeholder="请选择打卡开始时间">
                    </el-date-picker>
                  </el-form-item>
                  <el-form-item label="打卡结束时间" prop="endTime">
                    <el-date-picker clearable
                                    v-model="queryParams.endTime"
                                    type="date"
                                    value-format="yyyy-MM-dd"
                                    placeholder="请选择打卡结束时间">
                    </el-date-picker>
                  </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
            v-hasPermi="['hr:attendance:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['hr:attendance:edit']">
          修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini"
            :disabled="multiple" @click="handleDelete" v-hasPermi="['hr:attendance:remove']">
          删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini"
            @click="handleExport" v-hasPermi="['hr:attendance:export']">
          导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="attendanceList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
              <el-table-column label="" align="center" prop="id"/>
              <el-table-column label="员工姓名" align="center" prop="employeeName"/>
              <el-table-column label="所属部门" align="center" prop="department"/>
              <el-table-column label="打卡日期" align="center" prop="date" width="180">
                <template slot-scope="scope">
                  <span>{{ parseTime(scope.row.date, '{y}-{m}-{d}') }}</span>
                </template>
              </el-table-column>
              <el-table-column label="打卡开始时间" align="center" prop="startTime" width="180">
                <template slot-scope="scope">
                  <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
                </template>
              </el-table-column>
              <el-table-column label="打卡结束时间" align="center" prop="endTime" width="180">
                <template slot-scope="scope">
                  <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
                </template>
              </el-table-column>
              <el-table-column label="打卡状态" align="center" prop="status"/>
              <el-table-column label="" align="center" prop="remark"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['hr:attendance:edit']"
          >修改
          </el-button>
          <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['hr:attendance:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
    />

    <!-- 添加或修改打卡记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
                        <el-form-item label="员工姓名" prop="employeeName">
                          <el-input v-model="form.employeeName" placeholder="请输入员工姓名"/>
                        </el-form-item>
                        <el-form-item label="所属部门" prop="department">
                          <el-input v-model="form.department" placeholder="请输入所属部门"/>
                        </el-form-item>
                        <el-form-item label="打卡日期" prop="date">
                          <el-date-picker clearable
                                          v-model="form.date"
                                          type="date"
                                          value-format="yyyy-MM-dd"
                                          placeholder="请选择打卡日期">
                          </el-date-picker>
                        </el-form-item>
                        <el-form-item label="打卡开始时间" prop="startTime">
                          <el-date-picker clearable
                                          v-model="form.startTime"
                                          type="date"
                                          value-format="yyyy-MM-dd"
                                          placeholder="请选择打卡开始时间">
                          </el-date-picker>
                        </el-form-item>
                        <el-form-item label="打卡结束时间" prop="endTime">
                          <el-date-picker clearable
                                          v-model="form.endTime"
                                          type="date"
                                          value-format="yyyy-MM-dd"
                                          placeholder="请选择打卡结束时间">
                          </el-date-picker>
                        </el-form-item>
                        <el-form-item label="" prop="remark">
                          <el-input v-model="form.remark" placeholder="请输入"/>
                        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import {
    pageAttendance,
    getAttendance,
    delAttendance,
    addAttendance,
    updateAttendance
  } from "@/api/hr/attendance";

  export default {
    name: "Attendance",
    data() {
      return {
        loading: true,
        ids: [],
        single: true,
        multiple: true,
        showSearch: true,
        total: 0,
              attendanceList: [],
        title: "",
        open: false,
        queryParams: {
          pageNum: 1,
          pageSize: 10,
                        employeeName: null,
                        department: null,
                        date: null,
                        startTime: null,
                        endTime: null,
                        status: null,
        },
        form: {},
        rules: {
                        employeeName: [
                    {
                      required: true, message: "员工姓名不能为空", trigger: "blur" }
                  ],
                        department: [
                    {
                      required: true, message: "所属部门不能为空", trigger: "blur" }
                  ],
                        date: [
                    {
                      required: true, message: "打卡日期不能为空", trigger: "blur" }
                  ],
                        startTime: [
                    {
                      required: true, message: "打卡开始时间不能为空", trigger: "blur" }
                  ],
                        endTime: [
                    {
                      required: true, message: "打卡结束时间不能为空", trigger: "blur" }
                  ],
                        status: [
                    {
                      required: true, message: "打卡状态不能为空", trigger: "change" }
                  ],
        }
      };
    },
    created() {
      this.getList();
    },
  methods: {
    /** 查询打卡记录列表 */
    getList() {
      this.loading = true;
      pageAttendance(this.queryParams).then(response => {
        this.attendanceList = response.data.records;
        this.total = response.data.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
                      id: null,
                      employeeName: null,
                      department: null,
                      date: null,
                      startTime: null,
                      endTime: null,
                      status: null,
                      remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加打卡记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAttendance(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改打卡记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id!=null){
            updateAttendance (this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          }
        else
          {
            addAttendance(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id||this.ids;
      this.$modal.confirm('是否确认删除打卡记录编号为"' + ids + '"的数据项？').then(function () {
        return delAttendance(ids);}).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
  /** 导出按钮操作 */
  handleExport(){
    this.download('hr/attendance/export', {
      ...this.queryParams
    }, `attendance_${new Date().getTime()}.xlsx`)
  }
  }
  }
  ;
</script>
