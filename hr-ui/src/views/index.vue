<template>
  <div class="dashboard-editor-container">
    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="16">
        欢迎使用职工管理系统!
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <el-card v-for="notice in noticeList" class="box-card">
          <div slot="header" class="clearfix">
            <span>{{ notice.noticeTitle }}</span>
            <div style="float: right; padding: 3px 0">
              <dict-tag :options="dict.type.sys_notice_type" :value="notice.noticeType"/>
            </div>
          </div>
          <div v-html="notice.noticeContent" class="text item">
          </div>
          <div style="padding: 14px;">
            <div class="bottom clearfix">
              <time class="time">时间：{{ notice.createTime }}</time>
              <div style="float: right;">发布人：{{ notice.createBy }}</div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import {listNotice} from "@/api/system/notice";

export default {
  name: 'Index',
  components: {},
  dicts: ['sys_notice_type'],
  data() {
    return {
      noticeList: [],
      queryParams: {
        pageNum: 1,
        pageSize: 5,
      }
    }
  },
  created() {
    this.listNotice();
  },
  methods: {
    listNotice() {
      listNotice(this.queryParams).then(response => {
        this.noticeList = response.rows;
      });
    }
  }
}
</script>

<style lang="scss" scoped>
.dashboard-editor-container {
  padding: 32px;
  background-color: rgb(240, 242, 245);
  position: relative;

  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
}

@media (max-width: 1024px) {
  .chart-wrapper {
    padding: 8px;
  }
}
</style>
