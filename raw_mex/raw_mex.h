/*
 * raw_mex.h
 *
 *  Created on: Jan 7, 2014
 *      Author: igkiou
 */

#ifndef RAW_MEX_H_
#define RAW_MEX_H_

#include <math.h>
#include <string.h>
#include <fstream>
#include <string>
#include <vector>
#include <ctype.h>

#include "libraw.h"

#include "fileformat_mex.h"

namespace raw {

enum {raw_MAX_STRING_LENGTH=128};


typedef float FloatUsed;

mex::MxNumeric<bool> isRawFile(const mex::MxString& fileName);

class RawInputFile : public fileformat::InputFileInterface {
public:
	explicit RawInputFile(const mex::MxString& fileName);

	mex::MxString getFileName() const;
	mex::MxNumeric<bool> isValidFile() const;
	int getHeight() const;
	int getWidth() const;
	int getNumberOfChannels() const;
	mex::MxArray getAttribute(const mex::MxString& attributeName) const;
	mex::MxArray getAttribute() const;
	mex::MxArray readData();

	~RawInputFile() {	}

private:
	std::string m_fileName;
	LibRaw m_rawProcessor;
};

}	/* namespace raw */

#endif /* RAW_MEX_H_ */