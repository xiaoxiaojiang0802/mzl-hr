import request from '@/utils/request'

// 查询参数列表
export function selectIndex() {
  return request({
    url: '/hotel/index/selectIndex',
    method: 'get'
  })
}
