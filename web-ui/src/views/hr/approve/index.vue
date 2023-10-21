<template>
  <div class="app-container">
    <avue-crud ref="crud" :option="option" v-model:page="page" :table-loading="loading"
               @on-load="getList" @row-update="rowUpdate"
               @row-save="rowSave" @row-del="rowDel"
               @refresh-change="refreshChange" @search-reset="searchChange" @search-change="searchChange"
               v-model="form" :data="dataList">
      <template slot-scope="scope" slot="menuLeft">
        <el-button icon="el-icon-plus" size="medium" @click="$refs.crud.rowAdd()">请假</el-button>
        <el-button icon="el-icon-plus" size="medium" @click="$refs.crud.rowAdd()">绩效</el-button>
        <el-button icon="el-icon-plus" size="medium" @click="$refs.crud.rowAdd()">加班</el-button>
        <el-button icon="el-icon-plus" size="medium" @click="$refs.crud.rowAdd()">外出</el-button>
      </template>
    </avue-crud>
  </div>
</template>

<script>
import {
  pageApprove,
  getApprove,
  delApprove,
  addApprove,
  updateApprove
} from "@/api/hr/approve";

export default {
  name: "Approve",
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
        stripe: true,
        addBtn: false,
        column: [
          {
            label: "标题",
            prop: "title",
            type: "input",
            search: true,
          },
          {
            label: "审批类型",
            prop: "type",
            type: "select",
            search: true,
          },
          {
            label: "申请人",
            prop: "applicant",
            type: "input",
            search: false,
          },
          {
            label: "更新时间",
            prop: "updateTime",
            type: "datetime",
            search: false,
            display: true
          },
          {
            label: "状态",
            prop: "status",
            type: "radio",
            search: true,
          },
          {
            label: "当前审批人",
            prop: "approvedUser",
            type: "input",
            search: false,
          },
        ]
      },
    }
  },
  created() {
    this.getList();
  },
  methods: {
    getList() {
      this.loading = true;
      this.params.current = this.page.current;
      this.params.size = this.page.size;
      pageApprove(this.params).then(res => {
        const data = res.data;
        this.loading = false;
        this.page.total = data.total;
        const result = data.records;
        this.dataList = result;
      })
    },
    rowSave(row, done, loading) {
      addApprove(row).then(() => {
        this.$message.success('新增成功')
        done();
        this.getList();
      }).catch(() => {
        loading()
      })
    },
    rowUpdate(row, index, done, loading) {
      updateApprove(row).then(() => {
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
        return delApprove(row.id)
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
