<template>
  <div class="app-container">
    <avue-crud ref="crud" :option="option" v-model:page="page" :table-loading="loading"
               @on-load="getList" @row-update="rowUpdate"
               @row-save="rowSave" @row-del="rowDel"
               @refresh-change="refreshChange" @search-reset="searchChange" @search-change="searchChange"
               v-model="form" :data="dataList">
    </avue-crud>
  </div>
</template>

<script>
import {
  pagePerformance,
  getPerformance,
  delPerformance,
  addPerformance,
  updatePerformance
} from "@/api/hr/performance";

export default {
  name: "Performance",
  data() {
    return {
      page: {},
      form: {},
      params: {},
      loading: false,
      dataList: [],
      option:{
        index: true,
        align: 'center',
        headerAlign: 'center',
        border: true,
        stripe: true,
        column:  [
          {
            label: "",
            prop: "id",
            search: false,
          },
          {
            label: "员工姓名",
            prop: "employeeName",
            search: true,
            rules: [{
              required: true,
              message: "请输入名称员工姓名",
              trigger: "blur"
            }]
          },
          {
            label: "所属部门",
            prop: "department",
            search: true,
            rules: [{
              required: true,
              message: "请输入名称所属部门",
              trigger: "blur"
            }]
          },
          {
            label: "绩效周期",
            prop: "period",
            search: true,
            rules: [{
              required: true,
              message: "请输入名称绩效周期",
              trigger: "blur"
            }]
          },
          {
            label: "绩效评分",
            prop: "score",
            search: true,
            rules: [{
              required: true,
              message: "请输入名称绩效评分",
              trigger: "blur"
            }]
          },
          {
            label: "绩效评语",
            prop: "comment",
            search: true,
          },
          {
            label: "绩效状态",
            prop: "status",
            search: true,
          },
          {
            label: "绩效备注",
            prop: "remark",
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
      pagePerformance(this.params).then(res => {
        const data = res.data;
        this.loading = false;
        this.page.total = data.total;
        const result = data.records;
        this.dataList = result;
      })
    },
    rowSave(row, done, loading) {
      addPerformance(row).then(() => {
        this.$message.success('新增成功')
        done();
        this.getList();
      }).catch(() => {
        loading()
      })
    },
    rowUpdate(row, index, done, loading) {
      updatePerformance(row).then(() => {
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
        return delPerformance(row.id)
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
