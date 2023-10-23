<template>
  <div class="app-container">
    <avue-crud ref="crud" :option="option" v-model:page="page" :table-loading="loading"
               @on-load="getList" @row-update="rowUpdate" @date-change="dateChange"
               @row-save="rowSave" @row-del="rowDel"
               @refresh-change="refreshChange" @search-reset="searchChange" @search-change="searchChange"
               v-model="form" :data="dataList">
    </avue-crud>
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
import {listUser} from "@/api/system/user";

export default {
  name: "Leave",
  data() {
    return {
      page: {},
      form: {},
      params: {},
      loading: false,
      dataList: [],
      option: {
        align: 'center',
        headerAlign: 'center',
        column: [
          {
            label: "所属部门",
            prop: "department",
            search: false,
            display: false,
            rules: [{
              required: true,
              message: "请输入名称所属部门",
              trigger: "blur"
            }]
          },
          {
            label: "员工姓名",
            prop: "employeeId",
            search: true,
            type: 'select',
            props: {
              label: 'nickName',
              value: 'userId'
            },
            dicData: [],
            rules: [{
              required: true,
              message: "请输入名称员工姓名",
              trigger: "blur"
            }]
          },
          {
            label: "开始日期",
            prop: "startDate",
            type: 'datetime',
            searchRange: true,
            search: true,
            rules: [{
              required: true,
              message: "请输入名称请假开始日期",
              trigger: "blur"
            }]
          },
          {
            label: "结束日期",
            prop: "endDate",
            type: 'datetime',
            search: false,
            rules: [{
              required: true,
              message: "请输入名称请假结束日期",
              trigger: "blur"
            }]
          },
          {
            label: "请假类型",
            prop: "leaveType",
            type: "select",
            dicUrl: process.env.VUE_APP_BASE_API + '/system/dict/data/type/leave_type',
            props: {
              label: 'dictLabel',
              value: 'dictValue'
            },
            search: true,
            rules: [{
              required: true,
              message: "请输入名称请假类型",
              trigger: "blur"
            }]
          },
          {
            label: "请假理由",
            prop: "reason",
            rules: [{
              required: true,
              message: "请输入名称请假理由",
              trigger: "blur"
            }]
          },
          {
            label: "请假状态",
            prop: "status",
          },
          {
            label: "请假备注",
            prop: "remark",
          },
        ]
      },
    }
  },
  created() {
    this.listUser();
    this.getList();
  },
  methods: {
    dateChange(date) {
    },
    listUser() {
      listUser({}).then(response => {
          this.option.column.forEach(item => {
            if (item.prop === 'employeeId') {
              item.dicData.push(...response.rows);
            }
          })
        }
      );
    },
    getList() {
      this.loading = true;
      this.params.current = this.page.current;
      this.params.size = this.page.size;
      pageLeave(this.params).then(res => {
        const data = res.data;
        this.loading = false;
        this.page.total = data.total;
        const result = data.records;
        this.dataList = result;
      })
    },
    rowSave(row, done, loading) {
      addLeave(row).then(() => {
        this.$message.success('新增成功')
        done();
        this.getList();
      }).catch(() => {
        loading()
      })
    },
    rowUpdate(row, index, done, loading) {
      updateLeave(row).then(() => {
        this.$message.success('修改成功')
        done()
        this.getList();
      }).catch(() => {
        loading()
      })
    },
    rowDel(row) {
      this.$confirm('此操作将永久删除, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        return delLeave(row.id)
      }).then(() => {
        this.$message.success('删除成功')
        this.getList();
      })
    },
    searchChange(params, done) {
      if (done) done();
      this.params = params;
      this.page.current = 1;
      this.getList();
      this.$message.success('搜索成功')
    },
    refreshChange() {
      this.getList();
      this.$message.success('刷新成功')
    }
  }
}
</script>
