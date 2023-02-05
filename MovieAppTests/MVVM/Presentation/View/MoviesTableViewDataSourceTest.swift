import XCTest
@testable import Movie_App

class MoviesTableViewDataSourceTest: XCTestCase{
    
    var sut : MoviesTableViewDelegate!
    var mock : NavigationDetailMock!
    
    override func setUp() {
        super.setUp()
        sut = MoviesTableViewDelegate()
        mock = NavigationDetailMock()
        sut.viewController = mock
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDidSelection(){
        XCTAssertFalse(mock.success)
        sut.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mock.success)
    }
}
