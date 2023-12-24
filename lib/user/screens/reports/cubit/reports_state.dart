part of 'reports_cubit.dart';

@freezed
class ReportsState with _$ReportsState {
  const factory ReportsState.initial() = Initial;
  const factory ReportsState.changeDate()= ChangeDate;
  const factory ReportsState.showReportDetails()= ShowReportDetails;
  const factory ReportsState.reportDataLoading()= ReportDataLoading;
  const factory ReportsState.reportDataLoaded()= ReportDataLoaded;
  const factory ReportsState.statsDataLoading()= StatsDataLoading;
  const factory ReportsState.statsDataLoaded()= StatsDataLoaded;
  const factory ReportsState.statsWalletsSelected()= StatsWalletsSelected;
}
