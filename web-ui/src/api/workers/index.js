import request from '@/utils/request'

// 查询打卡记录列表
export function selectIndex() {
  return request({
    url: '/workers/index/selectIndex',
    method: 'get',
  })
}
