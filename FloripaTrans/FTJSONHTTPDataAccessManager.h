//
//  FTJSONHTTPDataAccessManager.h
//  FloripaTrans
//
//  Created by Vítor Makoto Matayoshi de Moraes on 3/6/15.
//  Copyright (c) 2015 Vitor Makoto. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "FTDataAccessProtocols.h"

@interface FTJSONHTTPDataAccessManager : AFHTTPSessionManager <FTDataAccessManager>

+ (instancetype) sharedManager;

@property (weak, nonatomic) id <FTDataAccessDelegate> delegate;

@end
