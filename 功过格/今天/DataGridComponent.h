
/**
 * DataGrid数据源
 */
@interface DataGridComponentDataSource : NSObject {
    /**
     * 标题列表
     */
    NSMutableArray *titles;
    /**
     * 数据体
     */
    NSMutableArray *data;
    /**
     * 列宽
     */
    NSMutableArray *columnWidth;
}
@property (retain) NSMutableArray *titles;
@property (retain) NSMutableArray *data;
@property (retain) NSMutableArray *columnWidth;
@end
@interface DataGridScrollView : UIScrollView {
    id dataGridComponent;
}
@property (assign) id dataGridComponent;
@end
/**
 * 数据列表组件，支持上下与左右滑动
 */
@interface DataGridComponent : UIView {
    //左下列视图
    DataGridScrollView *vLeft;
    //右下列视图
    DataGridScrollView *vRight;
    //右下列内容
    UIView *vRightContent;
    //左下列内容
    UIView *vLeftContent;
    //右上标题
    UIView *vTopRight;
    //左上标题
    UIView *vTopLeft;
    //列表数据源
    DataGridComponentDataSource *dataSource;
    //内容总高度
    float contentHeight;
    //内容总宽度
    float contentWidth;
    //单元格默认高度
    float cellHeight;
    //单元格默认宽度
    float cellWidth;
}
@property (readonly) DataGridScrollView *vRight;
@property (readonly) DataGridScrollView *vLeft;
@property (readonly) float cellHeight;
@property (retain) DataGridComponentDataSource *dataSource;
/**
 * 用指定显示区域与数据源初始化对象
 */
- (id)initWithFrame:(CGRect)aRect data:(DataGridComponentDataSource *)aDataSource;
@end