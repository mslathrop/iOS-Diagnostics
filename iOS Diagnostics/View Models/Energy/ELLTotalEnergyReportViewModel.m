//
//  ELLTotalEnergyReportViewModel.m
//  iOS Diagnostics
//
//  Created by Christopher Anderson on 10/11/2014.
//  Copyright (c) 2014 Electric Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELLTotalEnergyReportViewModel.h"
#import "ELLTotalEnergyForProcess.h"
#import "ELLTotalEnergyReportModel.h"
#import "ELLEnergyBreakdownReportModel.h"
#import "ELLEnergyBreakdownReportViewModel.h"

@implementation ELLTotalEnergyReportViewModel

-(NSInteger)numberOfItemsInSection:(NSInteger)section {
    ELLTotalEnergyReportModel *totalEnergyModel = (ELLTotalEnergyReportModel *)self.model;
    return totalEnergyModel.totalEnergyPerProcess.count;
}

-(NSString *)titleAtIndexPath:(NSIndexPath *)indexPath {
    return [self totalEnergyForProcessAtIndexPath:indexPath].processName;
}

-(NSString *)detailAtIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"%.2f", [self totalEnergyForProcessAtIndexPath:indexPath].totalEnergy];
}

- (BOOL)hasDetailForIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (ELLReportSectionViewModel *)viewModelForDetailAtIndexPath:(NSIndexPath *)indexPath {
    ELLTotalEnergyForProcess *totalEnergyForProcess = [self totalEnergyForProcessAtIndexPath:indexPath];
    ELLEnergyBreakdownReportModel *model = [[ELLEnergyBreakdownReportModel alloc] initWithLogAnalyser:self.model.logAnalyser
                                                                                    startDate:self.model.startDate
                                                                                      endDate:self.model.endDate
                                                                                processName:totalEnergyForProcess.processName];
    
    ELLEnergyBreakdownReportViewModel *viewModel = [[ELLEnergyBreakdownReportViewModel alloc] initWithModel:model
                                                                                        reportTitle:totalEnergyForProcess.processName];
    
    return viewModel;
}


#pragma mark Util

- (ELLTotalEnergyForProcess *)totalEnergyForProcessAtIndexPath:(NSIndexPath *)indexPath {
    ELLTotalEnergyReportModel *totalEnergyModel = (ELLTotalEnergyReportModel *)self.model;
    return totalEnergyModel.totalEnergyPerProcess[indexPath.row];
}


@end
