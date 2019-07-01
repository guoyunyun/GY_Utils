//
//  GYBaseViewModel.h
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/6/14.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, GYLoadStatus) {
    GYLoadNone,
    GYLoading,
    GYLoadSuccess,
    GYLoadFailed,
    GYLoadNoNetwork,
};

@protocol GYBaseViewModelDelegate <NSObject>

- (void)loadDataStatus:(GYLoadStatus)status;

@end

@interface GYBaseViewModel : NSObject


@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) NSUInteger perPage;
@property (nonatomic, assign) NSUInteger currentPageIndex;
@property (nonatomic, assign) BOOL fetchAllOnce;
@property (nonatomic, assign) BOOL hasMore;
@property (nonatomic, assign, readonly) BOOL loadSuccess;
@property (nonatomic, assign, readonly) BOOL needReload;

@property (nonatomic, strong) NSMutableArray *muDatalist;

@property (nonatomic, weak) id <GYBaseViewModelDelegate> delegate;

- (void)initialize;

- (void)fetchData;

- (void)fetchLocalData;

- (void)reloadData;

- (void)loadMore;

- (void)resetData;

- (void)successRequest:(NSArray *)array;

- (void)faileRequest;

//dataSource转cellViewModel
- (NSArray *)dataSourceWithModelList:(NSArray *)list;

//#pragma mark  cellModel
//
//+ (instancetype)instanceCellViewModel:(id)model;
//
//- (instancetype)initWithModel:(DCBBaseViewModel *)model;





@end

NS_ASSUME_NONNULL_END
