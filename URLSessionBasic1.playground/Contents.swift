import UIKit

// URL - Web Resource의 주소
let urlString =  "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=swift"
let url = URL(string: urlString)

url?.absoluteString // url의 문자주소
url?.scheme // 네트워킹의 방식
url?.host // host의 주소
url?.path // host이후의 주소
url?.query // 쿼리에 대한 정보
url?.baseURL // baseURL의 정보, base를 지정하지 않아 nil

let baseURL = URL(string: "https://search.naver.com")
let relativeURL = URL(string: "search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=swift", relativeTo: baseURL)

relativeURL?.absoluteString // url의 문자주소
relativeURL?.scheme // 네트워킹의 방식
relativeURL?.host // host의 주소
relativeURL?.path // host이후의 주소
relativeURL?.query // 쿼리에 대한 정보
relativeURL?.baseURL // baseURL의 정보

// URLComponents
// URL에 필요한 정보들에 대한 세팅
// URL에 한글이 들어가면 인식을 못함

var urlComponents = URLComponents(string: "https://search.naver.com/search.naver?")
let whereQuery = URLQueryItem(name: "where", value: "nexearch")
let smQuery = URLQueryItem(name: "sm", value: "top_hty")
let fbmQuery = URLQueryItem(name: "fbm", value: "1")
let ieQuery = URLQueryItem(name: "ie", value: "utf8")
let queryQuery = URLQueryItem(name: "query", value: "스위 프트")

urlComponents?.queryItems?.append(whereQuery)
urlComponents?.queryItems?.append(smQuery)
urlComponents?.queryItems?.append(fbmQuery)
urlComponents?.queryItems?.append(ieQuery)
urlComponents?.queryItems?.append(queryQuery)

urlComponents?.url
urlComponents?.string
urlComponents?.queryItems
urlComponents?.queryItems?.last?.value
