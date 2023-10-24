import request from '@/utils/request'

// 查询审批列表
export function pageApprove(query) {
  return request({
    url: '/workers/approve/page',
    method: 'get',
    params: query
  })
}

// 查询审批详细
export function getApprove(approvedId) {
  return request({
    url: '/workers/approve/getById/' + approvedId,
    method: 'get'
  })
}

// 新增审批
export function addApprove(data) {
  return request({
    url: '/workers/approve',
    method: 'post',
    data: data
  })
}

// 修改审批
export function updateApprove(data) {
  return request({
    url: '/workers/approve',
    method: 'put',
    data: data
  })
}

// 删除审批
export function delApprove(approvedId) {
  return request({
    url: '/workers/approve/removeByIds/' + approvedId,
    method: 'delete'
  })
}
