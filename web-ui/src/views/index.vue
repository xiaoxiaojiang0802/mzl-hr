<template>
  <div class="dashboard-editor-container">
    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="16">
        欢迎使用职工管理系统!
        <el-row :gutter="40" class="panel-group">
          <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
            <div class="card-panel">
              <div class="card-panel-icon-wrapper icon-people">
                <svg-icon icon-class="peoples" class-name="card-panel-icon"/>
              </div>
              <div class="card-panel-description">
                <div class="card-panel-text">
                  在职员工
                </div>
                <count-to :start-val="0" :end-val="indexVo.workerNumber" :duration="2600" class="card-panel-num"/>
              </div>
            </div>
          </el-col>
          <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
            <div class="card-panel">
              <div class="card-panel-icon-wrapper icon-message">
                <svg-icon icon-class="message" class-name="card-panel-icon"/>
              </div>
              <div class="card-panel-description">
                <div class="card-panel-text">
                  请假记录
                </div>
                <count-to :start-val="0" :end-val="indexVo.leaveNumber" :duration="3000" class="card-panel-num"/>
              </div>
            </div>
          </el-col>
          <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
            <div class="card-panel">
              <div class="card-panel-icon-wrapper icon-money">
                <svg-icon icon-class="money" class-name="card-panel-icon"/>
              </div>
              <div class="card-panel-description">
                <div class="card-panel-text">
                  奖惩金额
                </div>
                <count-to :start-val="0" :end-val="indexVo.leaveNumber" :duration="3200" class="card-panel-num"/>
              </div>
            </div>
          </el-col>
          <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
            <div class="card-panel">
              <div class="card-panel-icon-wrapper icon-shopping">
                <svg-icon icon-class="shopping" class-name="card-panel-icon"/>
              </div>
              <div class="card-panel-description">
                <div class="card-panel-text">
                  今日缺勤
                </div>
                <count-to :start-val="0" :end-val="indexVo.leaveNumber" :duration="3600" class="card-panel-num"/>
              </div>
            </div>
          </el-col>
        </el-row>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <span>系统公告</span>
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
import CountTo from 'vue-count-to';
import {listNotice} from "@/api/system/notice";
import {selectIndex} from "@/api/workers";

export default {
  name: 'Index',
  components: {CountTo},
  dicts: ['sys_notice_type'],
  data() {
    return {
      noticeList: [],
      indexVo: {
        workerNumber: 0,
        amount: 0,
        leaveNumber: 0,
        absenceNumber: 0,
      },
      queryParams: {
        pageNum: 1,
        pageSize: 5,
      }
    }
  },
  created() {
    this.selectIndex();
    this.listNotice();
  },
  methods: {
    selectIndex() {
      selectIndex().then(res => {
        this.indexVo = res.data;
      })
    },
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

.panel-group {
  margin-top: 18px;

  .card-panel-col {
    margin-bottom: 32px;
  }

  .card-panel {
    height: 108px;
    cursor: pointer;
    font-size: 12px;
    position: relative;
    overflow: hidden;
    color: #666;
    background: #fff;
    box-shadow: 4px 4px 40px rgba(0, 0, 0, .05);
    border-color: rgba(0, 0, 0, .05);

    &:hover {
      .card-panel-icon-wrapper {
        color: #fff;
      }

      .icon-people {
        background: #40c9c6;
      }

      .icon-message {
        background: #36a3f7;
      }

      .icon-money {
        background: #f4516c;
      }

      .icon-shopping {
        background: #34bfa3
      }
    }

    .icon-people {
      color: #40c9c6;
    }

    .icon-message {
      color: #36a3f7;
    }

    .icon-money {
      color: #f4516c;
    }

    .icon-shopping {
      color: #34bfa3
    }

    .card-panel-icon-wrapper {
      float: left;
      margin: 14px 0 0 14px;
      padding: 16px;
      transition: all 0.38s ease-out;
      border-radius: 6px;
    }

    .card-panel-icon {
      float: left;
      font-size: 48px;
    }

    .card-panel-description {
      float: right;
      font-weight: bold;
      margin: 26px;
      margin-left: 0px;

      .card-panel-text {
        line-height: 18px;
        color: rgba(0, 0, 0, 0.45);
        font-size: 16px;
        margin-bottom: 12px;
      }

      .card-panel-num {
        font-size: 20px;
      }
    }
  }
}

@media (max-width: 550px) {
  .card-panel-description {
    display: none;
  }

  .card-panel-icon-wrapper {
    float: none !important;
    width: 100%;
    height: 100%;
    margin: 0 !important;

    .svg-icon {
      display: block;
      margin: 14px auto !important;
      float: none !important;
    }
  }
}
</style>
