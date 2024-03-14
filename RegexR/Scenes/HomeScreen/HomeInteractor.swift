import Foundation

class HomeInteractor {
    var presenter: HomePresenter?
    
    func checkMatches(request: HomeModels.Request) {
        do {
            let regex = try NSRegularExpression(pattern: request.regex)
            let range = NSRange(request.stringList.startIndex..., in: request.stringList)
            let matches = regex.matches(in: request.stringList, options: [], range: range).map {
                String(request.stringList[Range($0.range, in: request.stringList)!])
            }
            
            presenter?.presentMatches(response: HomeModels.Response(matches: matches))
        } catch {
            presenter?.presentError(error: "Invalid regex pattern")
        }
    }
}
