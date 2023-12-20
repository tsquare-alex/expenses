part of 'reports_cubit.dart';

@freezed
class ReportsState with _$ReportsState {
  const factory ReportsState.initial() = Initial;
  const factory ReportsState.changeDate()= ChangeDate;
  const factory ReportsState.showReportDetails()= ShowReportDetails;
}
