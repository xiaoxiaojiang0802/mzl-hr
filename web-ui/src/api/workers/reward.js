import request from '@/utils/request'

// 查询奖惩列表
export function pageReward(query) {
  return request({
    url: '/example/reward/page',
    method: 'get',
    params: query
  })
}

// 查询奖惩详细
export function getReward(id) {
  return request({
    url: '/example/reward/getById/' + id,
    method: 'get'
  })
}

// 新增奖惩
export function addReward(data) {
  return request({
    url: '/example/reward',
    method: 'post',
    data: data
  })
}

// 修改奖惩
export function updateReward(data) {
  return request({
    url: '/example/reward',
    method: 'put',
    data: data
  })
}

// 删除奖惩
export function delReward(id) {
  return request({
    url: '/example/reward/removeByIds/' + id,
    method: 'delete'
  })
}
