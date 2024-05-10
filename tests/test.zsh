# This test should be run by sourcing this file

function runTest() {
    emulate -L zsh

    local scriptFile="$1"
    local scriptDir="$(dirname "${scriptFile}")"
    local testDirectory="$(mktemp -d)"
    local testNumber
    local expectedValue
    local actualValue

    unfunction .bd_get_pwd_parents _bd bd 1>/dev/null 2>&1
    source "${scriptDir}/../bd.plugin.zsh"

    # Setup testing directory
    printf -- 'Testing directory: "%s"\n' "${testDirectory}"
    printf -- '\n'

    printf -- '########################################\n'
    printf -- '## Test setup\n'
    printf -- '########################################\n'

    printf -- 'mkdir -p "a/b/c/d"\n'
    mkdir -p "${testDirectory}/a/b/c/d"

    printf -- 'cd "a/b/c/d"\n'
    cd "${testDirectory}/a/b/c/d"

    ############################################################################
    # Test 1: Basic named functionality
    ############################################################################
    testNumber="1"

    # Print test header
    printf -- '\n'
    printf -- '########################################\n'
    printf -- '## Test %s\n' "${testNumber}"
    printf -- '########################################\n'

    # Test actions
    printf -- 'bd b\n'
    bd b

    # Setup test info
    expectedValue="${testDirectory}/a/b"
    actualValue="${PWD}"

    # Print results
    printf -- '\n'
    printf -- 'PWD: "%s"\n' "${PWD}"

    # Check test results
    if [[ "${actualValue}" != "${expectedValue}" ]]; then
        cd
        rm -rf "${testDirectory}"
        printf -- 'ERROR: failed test %s\n' "${testNumber}"
        printf -- '  -- Expected value: "%s"\n' "${expectedValue}"
        printf -- '  -- Actual value  : "%s"\n' "${actualValue}"

        return 1
    fi

    ############################################################################
    # Test 2: Named functionality for entry with spaces
    ############################################################################
    testNumber="2"

    # Print test header
    printf -- '\n'
    printf -- '########################################\n'
    printf -- '## Test %s\n' "${testNumber}"
    printf -- '########################################\n'

    # Test actions
    printf -- 'mkdir -p "a/space dir/f/g/h"\n'
    printf -- 'cd "a/space dir/f/g/h"\n'
    printf -- 'bd "space dir"\n'
    mkdir -p 'a/space dir/f/g/h'
    cd 'a/space dir/f/g/h'
    bd 'space dir'

    # Setup test info
    expectedValue="${testDirectory}/a/b/a/space dir"
    actualValue="${PWD}"

    # Print results
    printf -- '\n'
    printf -- 'PWD: "%s"\n' "${PWD}"

    # Check test results
    if [[ "${actualValue}" != "${expectedValue}" ]]; then
        cd
        rm -rf "${testDirectory}"
        printf -- 'ERROR: failed test %s\n' "${testNumber}"
        printf -- '  -- Expected value: "%s"\n' "${expectedValue}"
        printf -- '  -- Actual value  : "%s"\n' "${actualValue}"

        return 1
    fi

    ############################################################################
    # Test 3: Named functionality more testing
    ############################################################################
    testNumber="3"

    # Print test header
    printf -- '\n'
    printf -- '########################################\n'
    printf -- '## Test %s\n' "${testNumber}"
    printf -- '########################################\n'

    # Test actions
    printf -- 'cd "f/g/h"\n'
    printf -- 'bd f\n'
    cd 'f/g/h'
    bd f

    # Setup test info
    expectedValue="${testDirectory}/a/b/a/space dir/f"
    actualValue="${PWD}"

    # Print results
    printf -- '\n'
    printf -- 'PWD: "%s"\n' "${PWD}"

    # Check test results
    if [[ "${actualValue}" != "${expectedValue}" ]]; then
        cd
        rm -rf "${testDirectory}"
        printf -- 'ERROR: failed test %s\n' "${testNumber}"
        printf -- '  -- Expected value: "%s"\n' "${expectedValue}"
        printf -- '  -- Actual value  : "%s"\n' "${actualValue}"

        return 1
    fi

    ############################################################################
    # Test 4: Named functionality jumping past directory with spaces and to last instance of name
    ############################################################################
    testNumber="4"

    # Print test header
    printf -- '\n'
    printf -- '########################################\n'
    printf -- '## Test %s\n' "${testNumber}"
    printf -- '########################################\n'

    # Test actions
    printf -- 'cd "g/h"\n'
    printf -- 'bd a\n'
    cd g/h
    bd a

    # Setup test info
    expectedValue="${testDirectory}/a/b/a"
    actualValue="${PWD}"

    # Print results
    printf -- '\n'
    printf -- 'PWD: "%s"\n' "${PWD}"

    # Check test results
    if [[ "${actualValue}" != "${expectedValue}" ]]; then
        cd
        rm -rf "${testDirectory}"
        printf -- 'ERROR: failed test %s\n' "${testNumber}"
        printf -- '  -- Expected value: "%s"\n' "${expectedValue}"
        printf -- '  -- Actual value  : "%s"\n' "${actualValue}"

        return 1
    fi

    ############################################################################
    # Test 5: Numeric jump back 1
    ############################################################################
    testNumber="5"

    # Print test header
    printf -- '\n'
    printf -- '########################################\n'
    printf -- '## Test %s\n' "${testNumber}"
    printf -- '########################################\n'

    # Test actions
    printf -- 'cd "space dir/f/g/h"\n'
    printf -- 'bd 1\n'
    cd 'space dir/f/g/h'
    bd 1

    # Setup test info
    expectedValue="${testDirectory}/a/b/a/space dir/f/g"
    actualValue="${PWD}"

    # Print results
    printf -- '\n'
    printf -- 'PWD: "%s"\n' "${PWD}"

    # Check test results
    if [[ "${actualValue}" != "${expectedValue}" ]]; then
        cd
        rm -rf "${testDirectory}"
        printf -- 'ERROR: failed test %s\n' "${testNumber}"
        printf -- '  -- Expected value: "%s"\n' "${expectedValue}"
        printf -- '  -- Actual value  : "%s"\n' "${actualValue}"

        return 1
    fi

    ############################################################################
    # Test 6: Numeric jump back 2
    ############################################################################
    testNumber="6"

    # Print test header
    printf -- '\n'
    printf -- '########################################\n'
    printf -- '## Test %s\n' "${testNumber}"
    printf -- '########################################\n'

    # Test actions
    printf -- 'bd 2\n'
    bd 2

    # Setup test info
    expectedValue="${testDirectory}/a/b/a/space dir"
    actualValue="${PWD}"

    # Print results
    printf -- '\n'
    printf -- 'PWD: "%s"\n' "${PWD}"

    # Check test results
    if [[ "${actualValue}" != "${expectedValue}" ]]; then
        cd
        rm -rf "${testDirectory}"
        printf -- 'ERROR: failed test %s\n' "${testNumber}"
        printf -- '  -- Expected value: "%s"\n' "${expectedValue}"
        printf -- '  -- Actual value  : "%s"\n' "${actualValue}"

        return 1
    fi

    ############################################################################
    # Test 7: Test numeric directory name
    ############################################################################
    testNumber="7"

    # Print test header
    printf -- '\n'
    printf -- '########################################\n'
    printf -- '## Test %s\n' "${testNumber}"
    printf -- '########################################\n'

    # Test actions
    printf -- 'mkdir -p "ncpc/2015/whistles"\n'
    printf -- 'cd "ncpc/2015/whistles"\n'
    printf -- 'bd 2015\n'
    mkdir -p 'ncpc/2015/whistles'
    cd 'ncpc/2015/whistles'
    bd 2015

    # Setup test info
    expectedValue="${testDirectory}/a/b/a/space dir/ncpc/2015"
    actualValue="${PWD}"

    # Print results
    printf -- '\n'
    printf -- 'PWD: "%s"\n' "${PWD}"

    # Check test results
    if [[ "${actualValue}" != "${expectedValue}" ]]; then
        cd
        rm -rf "${testDirectory}"
        printf -- 'ERROR: failed test %s\n' "${testNumber}"
        printf -- '  -- Expected value: "%s"\n' "${expectedValue}"
        printf -- '  -- Actual value  : "%s"\n' "${actualValue}"

        return 1
    fi

    ############################################################################
    # Test 8: Test numeric ambigious case
    ############################################################################
    testNumber="8"

    # Print test header
    printf -- '\n'
    printf -- '########################################\n'
    printf -- '## Test %s\n' "${testNumber}"
    printf -- '########################################\n'

    # Test actions
    printf -- 'mkdir -p "1/2/3"\n'
    printf -- 'cd "1/2/3"\n'
    printf -- 'bd 1\n'
    mkdir -p '1/2/3'
    cd '1/2/3'
    bd 1

    # Setup test info
    expectedValue="${testDirectory}/a/b/a/space dir/ncpc/2015/1"
    actualValue="${PWD}"

    # Print results
    printf -- '\n'
    printf -- 'PWD: "%s"\n' "${PWD}"

    # Check test results
    if [[ "${actualValue}" != "${expectedValue}" ]]; then
        cd
        rm -rf "${testDirectory}"
        printf -- 'ERROR: failed test %s\n' "${testNumber}"
        printf -- '  -- Expected value: "%s"\n' "${expectedValue}"
        printf -- '  -- Actual value  : "%s"\n' "${actualValue}"

        return 1
    fi

    ############################################################################
    # Test 9: Ensure current directly is not considered in target list
    ############################################################################
    testNumber="9"

    # Print test header
    printf -- '\n'
    printf -- '########################################\n'
    printf -- '## Test %s\n' "${testNumber}"
    printf -- '########################################\n'

    # Test actions
    printf -- 'mkdir -p "aaa/bbb/aaa/ccc"\n'
    printf -- 'cd "aaa/bbb/aaa"\n'
    printf -- 'bd aaa\n'
    mkdir -p 'aaa/bbb/aaa/ccc'
    cd 'aaa/bbb/aaa'
    bd aaa

    # Setup test info
    expectedValue="${testDirectory}/a/b/a/space dir/ncpc/2015/1/aaa"
    actualValue="${PWD}"

    # Print results
    printf -- '\n'
    printf -- 'PWD: "%s"\n' "${PWD}"

    # Check test results
    if [[ "${actualValue}" != "${expectedValue}" ]]; then
        cd
        rm -rf "${testDirectory}"
        printf -- 'ERROR: failed test %s\n' "${testNumber}"
        printf -- '  -- Expected value: "%s"\n' "${expectedValue}"
        printf -- '  -- Actual value  : "%s"\n' "${actualValue}"

        return 1
    fi

    # TODO: Load remaining tests
    # https://github.com/jasonlyle88/zsh-bd/blob/performance-and-completion-improvements/tests/bd.t

    printf -- '\n'
    printf -- 'All tests passed successfully\n'
    rm -rf "${testDirectory}"
}

# Run the test function in a subshell
(runTest $0)
unfunction runTest
