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
                  <el-form-item label="开始日期" prop="startDate">
                    <el-date-picker clearable
                                    v-model="queryParams.startDate"
                                    type="date"
                                    value-format="yyyy-MM-dd"
                                    placeholder="请选择请假开始日期">
                    </el-date-picker>
                  </el-form-item>
                  <el-form-item label="结束日期" prop="endDate">
                    <el-date-picker clearable
                                    v-model="queryParams.endDate"
                                    type="date"
                                    value-format="yyyy-MM-dd"
                                    placeholder="请选择请假结束日期">
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
            v-hasPermi="['hr:leave:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['hr:leave:edit']">
          修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini"
            :disabled="multiple" @click="handleDelete" v-hasPermi="['hr:leave:remove']">
          删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini"
            @click="handleExport" v-hasPermi="['hr:leave:export']">
          导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="leaveList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
              <el-table-column label="" align="center" prop="id"/>
              <el-table-column label="员工姓名" align="center" prop="employeeName"/>
              <el-table-column label="所属部门" align="center" prop="department"/>
              <el-table-column label="开始日期" align="center" prop="startDate" width="180">
                <template slot-scope="scope">
                  <span>{{ parseTime(scope.row.startDate, '{y}-{m}-{d}') }}</span>
                </template>
              </el-table-column>
              <el-table-column label="结束日期" align="center" prop="endDate" width="180">
                <template slot-scope="scope">
                  <span>{{ parseTime(scope.row.endDate, '{y}-{m}-{d}') }}</span>
                </template>
              </el-table-column>
              <el-table-column label="类型" align="center" prop="leaveType"/>
              <el-table-column label="理由" align="center" prop="reason"/>
              <el-table-column label="状态" align="center" prop="status"/>
              <el-table-column label="备注" align="center" prop="remark"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['hr:leave:edit']"
          >修改
          </el-button>
          <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['hr:leave:remove']"
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

    <!-- 添加或修改请假记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
                        <el-form-item label="员工姓名" prop="employeeName">
                          <el-input v-model="form.employeeName" placeholder="请输入员工姓名"/>
                        </el-form-item>
                        <el-form-item label="所属部门" prop="department">
                          <el-input v-model="form.department" placeholder="请输入所属部门"/>
                        </el-form-item>
                        <el-form-item label="开始日期" prop="startDate">
                          <el-date-picker clearable
                                          v-model="form.startDate"
                                          type="date"
                                          value-format="yyyy-MM-dd"
                                          placeholder="请选择请假开始日期">
                          </el-date-picker>
                        </el-form-item>
                        <el-form-item label="结束日期" prop="endDate">
                          <el-date-picker clearable
                                          v-model="form.endDate"
                                          type="date"
                                          value-format="yyyy-MM-dd"
                                          placeholder="请选择请假结束日期">
                          </el-date-picker>
                        </el-form-item>
                        <el-form-item label="理由" prop="reason">
                          <el-input v-model="form.reason" placeholder="请输入请假理由"/>
                        </el-form-item>
                        <el-form-item label="备注" prop="remark">
                          <el-input v-model="form.remark" placeholder="请输入请假备注"/>
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
    pageLeave,
    getLeave,
    delLeave,
    addLeave,
    updateLeave
  } from "@/api/hr/leave";

  export default {
    name: "Leave",
    data() {
      return {
        loading: true,
        ids: [],
        single: true,
        multiple: true,
        showSearch: true,
        total: 0,
              leaveList: [],
        title: "",
        open: false,
        queryParams: {
          pageNum: 1,
          pageSize: 10,
                        employeeName: null,
                        department: null,
                        startDate: null,
                        endDate: null,
                        leaveType: null,
                        reason: null,
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
                        startDate: [
                    {
                      required: true, message: "请假开始日期不能为空", trigger: "blur" }
                  ],
                        endDate: [
                    {
                      required: true, message: "请假结束日期不能为空", trigger: "blur" }
                  ],
                        leaveType: [
                    {
                      required: true, message: "请假类型，如事假、病假、婚假等不能为空", trigger: "change" }
                  ],
        }
      };
    },
    created() {
      this.getList();
    },
  methods: {
    /** 查询请假记录列表 */
    getList() {
      this.loading = true;
      pageLeave(this.queryParams).then(response => {
        this.leaveList = response.data.records;
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
                      startDate: null,
                      endDate: null,
                      leaveType: null,
                      reason: null,
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
      this.title = "添加请假记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getLeave(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改请假记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id!=null){
            updateLeave (this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          }
        else
          {
            addLeave(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除请假记录编号为"' + ids + '"的数据项？').then(function () {
        return delLeave(ids);}).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
  /** 导出按钮操作 */
  handleExport(){
    this.download('hr/leave/export', {
      ...this.queryParams
    }, `leave_${new Date().getTime()}.xlsx`)
  }
  }
  }
  ;
</script>
