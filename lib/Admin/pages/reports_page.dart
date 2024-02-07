import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String selectedReport = 'Financial Report';
  TextEditingController parameterController = TextEditingController();

  List<Map<String, dynamic>> reportData = [
    {'date': '2022-01-01', 'financial': 1500, 'appointments': 30},
    {'date': '2022-01-02', 'financial': 2000, 'appointments': 25},
    {'date': '2022-01-03', 'financial': 1800, 'appointments': 28},
  ];

  bool _sortAscending = true;
  String _sortColumn = 'date';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildReportDropdown(),
            SizedBox(height: 16.0),
            _buildParameterInput(),
            SizedBox(height: 16.0),
            _buildGenerateButton(),
            SizedBox(height: 16.0),
            _buildSortHeader(),
            _buildReportHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildReportDropdown() {
    return DropdownButton<String>(
      value: selectedReport,
      onChanged: (value) {
        setState(() {
          selectedReport = value!;
        });
      },
      items: ['Financial Report', 'Appointment History', 'Custom Report']
          .map((report) => DropdownMenuItem<String>(
                value: report,
                child: Text(report),
              ))
          .toList(),
    );
  }

  Widget _buildParameterInput() {
    return TextFormField(
      controller: parameterController,
      decoration: InputDecoration(
        labelText: 'Enter Parameters (if any)',
      ),
    );
  }

  Widget _buildGenerateButton() {
    return ElevatedButton(
      onPressed: _generateReport,
      child: Text('Generate Report'),
    );
  }

  void _generateReport() {
    final String reportDetails =
        'Report: $selectedReport\nParameters: ${parameterController.text}';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(reportDetails),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Widget _buildSortHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade800, Colors.purple.shade400],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: DataTable(
        sortColumnIndex: reportData.isNotEmpty
            ? reportData[0].keys.toList().indexOf(_sortColumn)
            : 0,
        sortAscending: _sortAscending,
        columns: _buildColumns(),
        rows: _buildRows(),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return reportData.isNotEmpty
        ? reportData[0].keys.map<DataColumn>((key) {
            return DataColumn(
              label: Text(
                key.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onSort: (columnIndex, ascending) {
                _sortData(key, ascending);
              },
            );
          }).toList()
        : [];
  }

  List<DataRow> _buildRows() {
    return reportData.map<DataRow>((data) {
      return DataRow(
        cells: data.entries.map<DataCell>((entry) {
          return DataCell(Text(
            entry.value.toString(),
            style: TextStyle(color: Colors.black),
          ));
        }).toList(),
      );
    }).toList();
  }

  void _sortData(String column, bool ascending) {
    setState(() {
      _sortColumn = column;
      _sortAscending = ascending;

      reportData.sort((a, b) {
        dynamic aValue = a[column];
        dynamic bValue = b[column];

        if (aValue is String) {
          return ascending
              ? aValue.compareTo(bValue)
              : bValue.compareTo(aValue);
        } else if (aValue is num) {
          return ascending
              ? aValue.compareTo(bValue)
              : bValue.compareTo(aValue);
        } else {
          return 0;
        }
      });
    });
  }

  Widget _buildReportHistory() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Report History',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),

          // Add your report history UI components here
        ],
      ),
    );
  }
}
