# read_rdb_hdr.jl
# based on
# https://gitlab.com/fMRI/toppe/blob/master/+toppe/+utils/read_rdb_hdr.m

include("rdb-26_002.jl")

"""
`s = read_rdb_hdr(fid::IOStream)`

Read GE raw (RDB) header for MRI scans

Returns NamedTuple `s` with header values accessible by s.key

Matlab version is:
Copyright (c) 2012 by General Electric Company. All rights reserved.

2019-05-22 Julia version by Jeff Fessler
"""
function read_rdb_hdr(fid::IOStream)
	seek(fid, 0)
	rdbm_rev = read(fid, Float32) # raw header (RDBM) revision number

	if rdbm_rev == Float32(26.002)
		s = read_rdb_hdr_26_002(fid)
	else
		throw("unknown RDBM rev $rdbm_rev")
	end

	if (s.rdbm_rev != rdbm_rev)
		throw("rev mismatch: $(s.rdbm_rev) != $rdbm_rev")
	end

	return s
end


"""
`s = read_rdb_hdr(file::String)`
"""
function read_rdb_hdr(file::String)
	fid = open(file)
	s = read_rdb_hdr(fid)
	close(fid)
	return s
end
