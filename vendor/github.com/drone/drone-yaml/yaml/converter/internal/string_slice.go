// Copyright 2019 Drone.IO Inc. All rights reserved.
// Use of this source code is governed by the Drone Non-Commercial License
// that can be found in the LICENSE file.

package internal

// StringSlice represents a slice of strings or a string.
type StringSlice []string

// UnmarshalYAML implements the Unmarshaller interface.
func (s *StringSlice) UnmarshalYAML(unmarshal func(interface{}) error) error {
	var stringType string
	if err := unmarshal(&stringType); err == nil {
		*s = []string{stringType}
		return nil
	}

	var sliceType []string
	if err := unmarshal(&sliceType); err != nil {
		return err
	}
	*s = sliceType
	return nil
}
