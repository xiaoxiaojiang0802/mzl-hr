import request from '@/utils/request'

// 查询绩效记录列表
export function pagePerformance(query) {
  return request({
    url: '/workers/performance/page',
    method: 'get',
    params: query
  })
}

// 查询绩效记录详细
export function getPerformance(id) {
  return request({
    url: '/workers/performance/getById/' + id,
    method: 'get'
  })
}

// 新增绩效记录
export function addPerformance(data) {
  return request({
    url: '/workers/performance',
    method: 'post',
    data: data
  })
}

// 修改绩效记录
export function updatePerformance(data) {
  return request({
    url: '/workers/performance',
    method: 'put',
    data: data
  })
}

// 删除绩效记录
export function delPerformance(id) {
  return request({
    url: '/workers/performance/removeByIds/' + id,
    method: 'delete'
  })
}
