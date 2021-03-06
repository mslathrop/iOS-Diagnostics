//
//  ELLSignalBreakdownModel.h
//  iOS Diagnostics
//
//  Created by Christopher Anderson on 11/11/2014.
//  Copyright (c) 2014 Electric Labs. All rights reserved.
//

#import "ELLReportSectionModel.h"

@interface ELLSignalBreakdownModel : ELLReportSectionModel

@property (nonatomic, readonly, strong) NSArray *signalBarToPercentage;

@end
