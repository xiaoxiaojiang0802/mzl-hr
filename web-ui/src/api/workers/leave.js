import request from '@/utils/request'

// 查询请假记录列表
export function pageLeave(query) {
  return request({
    url: '/workers/leave/page',
    method: 'get',
    params: query
  })
}

// 查询请假记录详细
export function getLeave(id) {
  return request({
    url: '/workers/leave/getById/' + id,
    method: 'get'
  })
}

// 新增请假记录
export function addLeave(data) {
  return request({
    url: '/workers/leave',
    method: 'post',
    data: data
  })
}

// 修改请假记录
export function updateLeave(data) {
  return request({
    url: '/workers/leave',
    method: 'put',
    data: data
  })
}

// 删除请假记录
export function delLeave(id) {
  return request({
    url: '/workers/leave/removeByIds/' + id,
    method: 'delete'
  })
}
