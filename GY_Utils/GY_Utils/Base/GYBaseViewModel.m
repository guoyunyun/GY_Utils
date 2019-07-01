//
//  GYBaseViewModel.m
//  GY_Utils
//
//  Created by shuidi_iMac on 2019/6/14.
//  Copyright © 2019 shuidi_iMac. All rights reserved.
//

#import "GYBaseViewModel.h"

@interface GYBaseViewModel()

@property (nonatomic, assign) BOOL hasMoreData;
@property (nonatomic, assign) GYLoadStatus loadStatus;

@end

@implementation GYBaseViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _loadStatus = GYLoadNone;
        _fetchAllOnce = NO;
        
        [self initialize];
    }
    return self;
}

- (void)initialize{
    
}

- (NSMutableArray *)muDatalist {
    if (!_muDatalist) {
        _muDatalist = [NSMutableArray array];
    }
    return _muDatalist;
}


- (void)successRequest:(NSArray *)array{
    
    if (_currentPageIndex == 1) {
        [self.muDatalist removeAllObjects];
    }
    
    self.hasMoreData = self.fetchAllOnce ? NO : array.count > 0;
    
    self.loadStatus = GYLoadSuccess;
    
    if (self.delegate) {
        [self.delegate loadDataStatus:_loadStatus];
    }
}

- (void)faileRequest{
    
    self.loadStatus = GYLoadFailed;
    
    if (self.delegate) {
        [self.delegate loadDataStatus:_loadStatus];
    }
}

- (void)fetchLocalData{
    
    
}

- (NSArray *)dataSourceWithModelList:(NSArray *)list{
    
    return nil;
}

- (void)reloadData{
    
    if ([self isLoading]) {
        return;
    }
    
    self.currentPageIndex = 1;
    self.loadStatus = GYLoading;
    
    if (self.delegate) {
        [self.delegate loadDataStatus:_loadStatus];
    }
    
    [self fetchData];
    
}

- (void)loadMore{
    
    if (_fetchAllOnce) {
        return;
    }
    
    if ([self isLoading]) {
        return;
    }
    self.loadStatus = GYLoading;
    self.currentPageIndex ++;
    
    if (self.delegate) {
        [self.delegate loadDataStatus:_loadStatus];
    }
    
    [self fetchData];
}

- (void)fetchData{
    
    
}

- (BOOL)isLoading {
    return _loadStatus == GYLoading;
}

//- (BOOL)hasMore {
//    return _hasMoreData;
//}

- (BOOL)needReload {
    return _loadStatus == GYLoadNone || _loadStatus == GYLoadFailed;
}

- (BOOL)loadSuccess {
    return _loadStatus == GYLoadSuccess;
}

- (void)resetData {
    
    _currentPageIndex = 1;
    _loadStatus = GYLoadNone;
    
}

//#pragma mark  cellModel
//
//+ (instancetype)instanceCellViewModel:(id)model{
//
//    return [[self alloc] initWithModel:model];
//}
//
//- (instancetype)initWithModel:(DCBBaseViewModel *)model{
//
//    if (self = [super init]) {
//
//    }
//    return self;
//}



@end
