#!usr/bin/python
# -*- coding: utf-8 -*-

import argparse, re
from pathlib import Path


def replace(file, ip, port, scheme='http', prefix='/api/v1/'):
    repl = scheme + '://' + ip + ':' + port + prefix
    
    pattern = re.compile(r'''
        (?P<scheme>(\w+))               # scheme
        ://
        (?P<ip>(\d+\.?){4})             # ip
        :(?P<port>\d+)                  # port
        (?P<prefix>(/api/v\d+/)*)?      # prefix
    ''', re.X)

    with open(file, 'r') as f:
        s = f.read()
    s = re.sub(pattern, repl, s)
    with open(file, 'w') as f:
        f.write(s)


def is_valid_ip(ip):
    r = re.match(r'^(\d+\.){3}(\d+)$', ip)
    if r:
        return True
    return False


def is_valid_port(port):
    r = re.match(r'^\d+$', port)
    if r:
        return True
    return False


def is_valid_file(file):
    if Path(file).is_file():
        return True
    return False


def verify_args(args):
    if not is_valid_file(args.file):
        print('ERROR: The file you specified seems not a valid file.')
        exit()
    if not args.ip:
        print('ERROR: You need to provide an ip.')
        exit()
    if not is_valid_ip(args.ip):
        print('ERROR: The ip you specified seems not a valid ip.')
        exit()
    if not args.port:
        args.port = '8000'
    if not is_valid_port(args.port):
        print('ERROR: The port you specified seems not a valid port.')
        exit()

    return args


DESC = '''
Replace ip and ports in static files before running the only_office.
'''


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=DESC)
    parser.add_argument('file', type=str, help='the file you want to replace')
    parser.add_argument('-i', dest='ip', type=str, help='ip that you want to replace to')
    parser.add_argument('-p', dest='port', type=str, help='port, default to 8000')
    args = parser.parse_args()
    args = verify_args(args)

    replace(args.file, args.ip, args.port)
