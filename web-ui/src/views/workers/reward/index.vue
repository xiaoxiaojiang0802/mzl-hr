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
import {addReward, delReward, pageReward, updateReward} from "@/api/workers/reward";

export default {
  dicts: ["reward_state"],
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
            label: "奖惩日期",
            prop: "recordDate",
            type: "datetime",
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
            dicUrl: process.env.VUE_APP_BASE_API + '/system/dict/data/type/reward_state',
            props: {
              label: 'dictLabel',
              value: 'dictValue'
            },
            rules: [{
              required: true,
              message: "请输入名称奖惩类型",
              trigger: "blur"
            }]
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
            display: false,
            rules: [{
              required: true,
              message: "请输入名称奖惩状态",
              trigger: "blur"
            }]
          },
          {
            label: "奖惩原因",
            prop: "reason",
            type: "textarea",
            search: false,
          },
          {
            label: "备注",
            prop: "remark",
            type: "textarea",
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
        this.dataList = data.records;
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
