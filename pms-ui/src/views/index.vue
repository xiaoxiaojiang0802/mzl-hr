<template>
  <div class="dashboard-editor-container">
    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="16">
        <el-row>
          <el-col>
            <el-button v-hasPermi="['system:config:add']"  type="primary">审批</el-button> 
            <el-button v-hasPermi="['system:config:add']" @click="goPage('/user-add')" type="primary">入职</el-button>
            <el-button v-hasPermi="['system:config:add']" type="primary">请假</el-button>
            <el-button v-hasPermi="['system:config:add']" type="primary">外出</el-button>
            <el-button v-hasPermi="['system:config:add']" type="primary">加班</el-button>
            <el-button v-hasPermi="['system:config:add']" type="primary">公出</el-button> 
          </el-col>
        </el-row>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <el-calendar v-model="value">
        </el-calendar>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  export default {
    name: 'Index',
    components: {

    },
    data() {
      return {
        date: new Date()
      }
    },
    methods: {
      goPage(url){
        this.$router.push(url).catch(()=>{});
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

  @media (max-width:1024px) {
    .chart-wrapper {
      padding: 8px;
    }
  }
</style>