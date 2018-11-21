import os
import xlwt
import json
import collections


class XlsxWriter(object):
    def __init__(self, headers=None):
        self.workbook = xlwt.Workbook(encoding='utf-8')
        self.work_sheet = self.workbook.add_sheet('sheet1')
        if headers:
            self.headers = headers
            self.write_headers()

    def write_headers(self, headers=None):
        if headers:
            self.headers = headers
        for i in range(len(self.headers)):
            self.work_sheet.write(0, i, self.headers[i], self.style(bold=True))

    def write(self, row, col, data, style=None):
        if not style:
            style = self.style()
        self.work_sheet.write(row, col, data, style)

    def new_sheet(self, name):
        self.work_sheet = workbook.add_sheet(name)

    def save(self, filename):
        self.workbook.save(filename)

    @staticmethod
    def style(name='Times New Roman', height=220, bold=False, border_color=None, bg_color=None):
        _style = xlwt.XFStyle()

        font = xlwt.Font()
        font.name = name
        font.bold = bold
        font.color_index = 4
        font.height = height
        _style.font = font

        if border_color is not None:
            borders = xlwt.Borders()
            borders.top = borders.MEDIUM
            borders.top_colour = border_color
            _style.borders = borders

        if bg_color is not None:
            # not working
            pattern = xlwt.Pattern()
            pattern.pattern = pattern.SOLID_PATTERN
            pattern.pattern_back_colour = bg_color
            _style.pattern = pattern
        return _style


class BookmarkExporter(XlsxWriter):
    def __init__(self):
        super(BookmarkExporter, self).__init__(headers=['文书', '书签', '占位符'])
        self.current_row = 1

    def export_from_file(self, filename):
        if not filename.endswith('.json') or filename.endswith('.info.json'):
            print('{} is not a bookmark json file, skip.'.format(filename))
            return

        with open(filename, 'r') as fp:
            json_ = json.load(fp, object_pairs_hook=collections.OrderedDict)

        # 写文书名
        _name = filename.split('.')[-2]
        name = _name.split('/')[-1]
        self.write(self.current_row, 0, name)

        # 写书签名
        for bookmark in json_:
            # 第current_row行, 第2列
            self.write(self.current_row, 1, bookmark)

            try:
                for slot in json_[bookmark][0].keys():
                    # 第current_row行, 第3列
                    self.write(self.current_row, 2, slot)
                    self.current_row += 1
            except TypeError:
                print(filename)
                print(bookmark)

            self.current_row += 1

    def export_from_folder(self, folder):
        for _, _, files in os.walk(folder):
            for file in files:
                self.export_from_file(os.path.join(folder, file))


if __name__ == '__main__':
    exporter = BookmarkExporter()
    exporter.export_from_folder('./test')
    exporter.save('./test.xlsx')
