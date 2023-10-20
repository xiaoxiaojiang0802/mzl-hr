import request from '@/utils/request'

// 查询打卡记录列表
export function pageAttendance(query) {
  return request({
    url: '/hr/attendance/page',
    method: 'get',
    params: query
  })
}

// 查询打卡记录详细
export function getAttendance(id) {
  return request({
    url: '/hr/attendance/getById/' + id,
    method: 'get'
  })
}

// 新增打卡记录
export function addAttendance(data) {
  return request({
    url: '/hr/attendance',
    method: 'post',
    data: data
  })
}

// 修改打卡记录
export function updateAttendance(data) {
  return request({
    url: '/hr/attendance',
    method: 'put',
    data: data
  })
}

// 删除打卡记录
export function delAttendance(id) {
  return request({
    url: '/hr/attendance/removeByIds/' + id,
    method: 'delete'
  })
}
