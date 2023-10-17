<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="80px">
      <el-row>
        <el-col :span="12">
          <el-form-item label="用户昵称" prop="nickName">
            <el-input v-model="form.nickName" placeholder="请输入用户昵称" maxlength="30" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="归属部门" prop="deptId">
            <treeselect v-model="form.deptId" :options="deptOptions" :show-count="true" placeholder="请选择归属部门" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="手机号码" prop="phonenumber">
            <el-input v-model="form.phonenumber" placeholder="请输入手机号码" maxlength="11" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="邮箱" prop="email">
            <el-input v-model="form.email" placeholder="请输入邮箱" maxlength="50" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item v-if="form.userId == undefined" label="用户名称" prop="userName">
            <el-input v-model="form.userName" placeholder="请输入用户名称" maxlength="30" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item v-if="form.userId == undefined" label="用户密码" prop="password">
            <el-input v-model="form.password" placeholder="请输入用户密码" type="password" maxlength="20" show-password />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="用户性别">
            <el-select v-model="form.sex" placeholder="请选择性别">
              <el-option v-for="dict in dict.type.sys_user_sex" :key="dict.value" :label="dict.label"
                :value="dict.value"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="状态">
            <el-radio-group v-model="form.status">
              <el-radio v-for="dict in dict.type.sys_normal_disable" :key="dict.value"
                :label="dict.value">{{dict.label}}</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="岗位">
            <el-select v-model="form.postIds" multiple placeholder="请选择岗位">
              <el-option v-for="item in postOptions" :key="item.postId" :label="item.postName" :value="item.postId"
                :disabled="item.status === 1"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="角色">
            <el-select v-model="form.roleIds" multiple placeholder="请选择角色">
              <el-option v-for="item in roleOptions" :key="item.roleId" :label="item.roleName" :value="item.roleId"
                :disabled="item.status === 1"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="入职时间">
            <el-date-picker v-model="form.entry" type="date" placeholder="选择日期时间">
            </el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="合同到期">
            <el-date-picker v-model="form.due" type="date" placeholder="选择日期时间">
            </el-date-picker>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item label="备注">
            <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button type="primary" @click="submitForm">确 定</el-button>
      <el-button @click="cancel">取 消</el-button>
    </div>
  </div>
</template>

<script>
  import {
    listUser,
    getUser,
    delUser,
    addUser,
    updateUser,
    resetUserPwd,
    changeUserStatus,
    deptTreeSelect
  } from "@/api/system/user";
  import {
    getToken
  } from "@/utils/auth";
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";

  export default {
    name: "AddUser",
    dicts: ['sys_normal_disable', 'sys_user_sex'],
    components: {
      Treeselect
    },
    data() {
      return {
        loading: true,
        ids: [],
        single: true,
        multiple: true,
        showSearch: true,
        total: 0,
        userList: null,
        title: "",
        deptOptions: undefined,
        open: false,
        deptName: undefined,
        initPassword: undefined,
        dateRange: [],
        postOptions: [],
        roleOptions: [],
        form: {},
        defaultProps: {
          children: "children",
          label: "label"
        },
        // 用户导入参数
        upload: {
          // 是否显示弹出层（用户导入）
          open: false,
          // 弹出层标题（用户导入）
          title: "",
          // 是否禁用上传
          isUploading: false,
          // 是否更新已经存在的用户数据
          updateSupport: 0,
          // 设置上传的请求头部
          headers: {
            Authorization: "Bearer " + getToken()
          },
          // 上传的地址
          url: process.env.VUE_APP_BASE_API + "/system/user/importData"
        },
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          userName: undefined,
          phonenumber: undefined,
          status: undefined,
          deptId: undefined
        },
        // 列信息
        columns: [{
            key: 0,
            label: `用户编号`,
            visible: true
          },
          {
            key: 1,
            label: `用户名称`,
            visible: true
          },
          {
            key: 2,
            label: `用户昵称`,
            visible: true
          },
          {
            key: 3,
            label: `部门`,
            visible: true
          },
          {
            key: 4,
            label: `手机号码`,
            visible: true
          },
          {
            key: 5,
            label: `状态`,
            visible: true
          },
          {
            key: 6,
            label: `创建时间`,
            visible: true
          },
          {
            key: 7,
            label: `入职时间`,
            visible: true
          }
        ],
        // 表单校验
        rules: {
          userName: [{
              required: true,
              message: "用户名称不能为空",
              trigger: "blur"
            },
            {
              min: 2,
              max: 20,
              message: '用户名称长度必须介于 2 和 20 之间',
              trigger: 'blur'
            }
          ],
          nickName: [{
            required: true,
            message: "用户昵称不能为空",
            trigger: "blur"
          }],
          password: [{
              required: true,
              message: "用户密码不能为空",
              trigger: "blur"
            },
            {
              min: 5,
              max: 20,
              message: '用户密码长度必须介于 5 和 20 之间',
              trigger: 'blur'
            }
          ],
          email: [{
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }],
          phonenumber: [{
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }]
        }
      };
    },
    watch: {
      // 根据名称筛选部门树
      deptName(val) {
        this.$refs.tree.filter(val);
      }
    },
    created() {
      this.handleAdd();
      this.getDeptTree();
      this.getConfigKey("sys.user.initPassword").then(response => {
        this.initPassword = response.msg;
      });
    },
    methods: {
      /** 查询部门下拉树结构 */
      getDeptTree() {
        deptTreeSelect().then(response => {
          this.deptOptions = response.data;
        });
      },
      // 筛选节点
      filterNode(value, data) {
        if (!value) return true;
        return data.label.indexOf(value) !== -1;
      },
      // 节点单击事件
      handleNodeClick(data) {
        this.queryParams.deptId = data.id;
        this.handleQuery();
      },
      // 用户状态修改
      handleStatusChange(row) {
        let text = row.status === "0" ? "启用" : "停用";
        this.$modal.confirm('确认要"' + text + '""' + row.userName + '"用户吗？').then(function() {
          return changeUserStatus(row.userId, row.status);
        }).then(() => {
          this.$modal.msgSuccess(text + "成功");
        }).catch(function() {
          row.status = row.status === "0" ? "1" : "0";
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
          userId: undefined,
          deptId: undefined,
          userName: undefined,
          nickName: undefined,
          password: undefined,
          phonenumber: undefined,
          email: undefined,
          sex: undefined,
          status: "0",
          remark: undefined,
          postIds: [],
          roleIds: []
        };
        this.resetForm("form");
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.dateRange = [];
        this.resetForm("queryForm");
        this.handleQuery();
      },
      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.userId);
        this.single = selection.length != 1;
        this.multiple = !selection.length;
      },
      // 更多操作触发
      handleCommand(command, row) {
        switch (command) {
          case "handleResetPwd":
            this.handleResetPwd(row);
            break;
          case "handleAuthRole":
            this.handleAuthRole(row);
            break;
          default:
            break;
        }
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        getUser().then(response => {
          this.postOptions = response.data.posts;
          this.roleOptions = response.data.roles;
          this.form.password = this.initPassword;
        });
      },
      /** 重置密码按钮操作 */
      handleResetPwd(row) {
        this.$prompt('请输入"' + row.userName + '"的新密码', "提示", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          closeOnClickModal: false,
          inputPattern: /^.{5,20}$/,
          inputErrorMessage: "用户密码长度必须介于 5 和 20 之间"
        }).then(({
          value
        }) => {
          resetUserPwd(row.userId, value).then(response => {
            this.$modal.msgSuccess("修改成功，新密码是：" + value);
          });
        }).catch(() => {});
      },
      /** 分配角色操作 */
      handleAuthRole: function(row) {
        const userId = row.userId;
        this.$router.push("/system/user-auth/role/" + userId);
      },
      /** 提交按钮 */
      submitForm: function() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.userId != undefined) {
              updateUser(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addUser(this.form).then(response => {
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
        const userIds = row.userId || this.ids;
        this.$modal.confirm('是否确认删除用户编号为"' + userIds + '"的数据项？').then(function() {
          return delUser(userIds);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('system/user/export', {
          ...this.queryParams
        }, `user_${new Date().getTime()}.xlsx`)
      },
      /** 导入按钮操作 */
      handleImport() {
        this.upload.title = "用户导入";
        this.upload.open = true;
      },
      /** 下载模板操作 */
      importTemplate() {
        this.download('system/user/importTemplate', {}, `user_template_${new Date().getTime()}.xlsx`)
      },
      // 文件上传中处理
      handleFileUploadProgress(event, file, fileList) {
        this.upload.isUploading = true;
      },
      // 提交上传文件
      submitFileForm() {
        this.$refs.upload.submit();
      }
    }
  };
</script>
