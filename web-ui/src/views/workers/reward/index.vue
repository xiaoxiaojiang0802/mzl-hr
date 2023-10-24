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
  pageReward,
  getReward,
  delReward,
  addReward,
  updateReward
} from "@/api/workers/reward";

export default {
  name: "Reward",
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
        column: [
          {
            label: "",
            prop: "id",
            type: "input",
            search: false,
          },
          {
            label: "员工姓名",
            prop: "employeeName",
            type: "input",
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
            type: "input",
            search: true,
            rules: [{
              required: true,
              message: "请输入名称所属部门",
              trigger: "blur"
            }]
          },
          {
            label: "奖惩日期",
            prop: "date",
            type: "datetime",
            search: true,
            rules: [{
              required: true,
              message: "请输入名称奖惩日期",
              trigger: "blur"
            }]
          },
          {
            label: "奖惩类型",
            prop: "type",
            type: "select",
            search: true,
            rules: [{
              required: true,
              message: "请输入名称奖惩类型",
              trigger: "blur"
            }]
          },
          {
            label: "奖惩原因",
            prop: "reason",
            type: "input",
            search: false,
          },
          {
            label: "奖惩金额",
            prop: "amount",
            type: "input",
            search: false,
          },
          {
            label: "奖惩状态",
            prop: "status",
            type: "radio",
            search: true,
            rules: [{
              required: true,
              message: "请输入名称奖惩状态",
              trigger: "blur"
            }]
          },
          {
            label: "",
            prop: "remark",
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
      pageReward(this.params).then(res => {
        const data = res.data;
        this.loading = false;
        this.page.total = data.total;
        const result = data.records;
        this.dataList = result;
      })
    },
    rowSave(row, done, loading) {
      addReward(row).then(() => {
        this.$message.success('新增成功')
        done();
        this.getList();
      }).catch(() => {
        loading()
      })
    },
    rowUpdate(row, index, done, loading) {
      updateReward(row).then(() => {
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
        return delReward(row.id)
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
